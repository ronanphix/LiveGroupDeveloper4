/**
 * Created by ronanwilliams on 2019-11-14.
 */

public class TogglCallout {

    // single post opportunity to project
    @Future(Callout=true)
    public static void postProject(Id oppId){

        Opportunity opp  = [SELECT Name, TogglId__c, AccountId, Account.Name,
                            Account.TogglId__c, Filtered_Job_Number__c
                            FROM Opportunity WHERE Id = :oppId];
        String clientId  = opp.Account.TogglId__c;
        String projectId = opp.TogglId__c;

        if (clientId == null){
            HttpRequest clientRequest = togglAuth('api/v8/clients', 'POST');
            clientRequest.setBody('{"client":{"name":"' + opp.Account.Name + '","wid":' + System.Label.TogglWorkspaceId + '}}');
            HttpResponse clientResponse  = Test.isRunningTest() ? MockHandler.getTogglClientMock() : new Http().send(clientRequest);
            clientId = clientResponse.getStatusCode() == 200 ? getPostResponseId(clientResponse) : null;
        }

        HttpRequest projectRequest = togglAuth('api/v8/projects', 'POST');
        projectRequest.setBody('{"project":{"name":"' + opp.Filtered_Job_Number__c + ' ' +
                                opp.Name + '","wid":3375044,"is_private":false,"cid":' + clientId + '}}');
        HttpResponse projectResponse  = Test.isRunningTest() ? MockHandler.getTogglProjectMock() : new Http().send(projectRequest);
        projectId = projectResponse.getStatusCode() == 200 ? getPostResponseId(projectResponse) : null;

        if (clientId != opp.Account.TogglId__c){
            update new Account(Id = opp.AccountId, TogglId__c = clientId);
        }

        opp.TogglId__c = projectId;
        update opp;

    }

    // post product to project
    @Future(Callout=true)
    public static void postProduct(Set<Id> productIds){

        List<Product2> product2s  = [SELECT Name, TogglId__c, Id
                                    FROM Product2 WHERE Id IN :productIds
                                    AND TogglId__c = NULL];

        for (Product2 prod : product2s){
            HttpRequest tagRequest = togglAuth('api/v8/tags', 'POST');
            tagRequest.setBody('{"tag":{"name":"' + prod.Name + '","wid":' + System.Label.TogglWorkspaceId + '}}');
            HttpResponse tagResponse  = Test.isRunningTest() ? MockHandler.getTogglTagMock() : new Http().send(tagRequest);
            prod.TogglId__c = tagResponse.getStatusCode() == 200 ? getPostResponseId(tagResponse) : null;
        }

        update product2s;
    }

    // get time entries on sync
//    @Future(Callout=true)
    public static void getTimeEntries(){

        // get map of all users by email
        Map<String,Employee1__c> employeeMap = getEmployeeMap();
        Set<String> unknownUsers = new Set<String>();

        Map<String,String> idEmailMap  = new Map<String,String>();

        // get set of all Opportunity external Ids
        Map<String,String> oppIdMap = getOppExternalIds();

        HttpRequest usersRequest    = togglAuth('api/v8/workspaces/' + System.Label.TogglWorkspaceId + '/workspace_users', 'GET');
        HttpResponse usersResponse  = Test.isRunningTest() ? MockHandler.getTogglUsersMock() : new Http().send(usersRequest);

        if (usersResponse.getStatusCode() == 200){
            List<Object> employees = (List<Object>)JSON.deserializeUntyped(usersResponse.getBody());

            for (Object employee : employees){
                Map<String,Object> empMap = (Map<String,Object>)employee;

                if (employeeMap.containsKey((String)empMap.get('email')) &&
                        String.valueOf((Integer)empMap.get('uid')) != employeeMap.get((String)empMap.get('email')).TogglId__c){
                    employeeMap.get((String)empMap.get('email')).TogglId__c = String.valueOf((Integer)empMap.get('uid'));
                    idEmailMap.put(String.valueOf((Integer)empMap.get('uid')),(String)empMap.get('email'));
                } else if (!employeeMap.containsKey((String)empMap.get('email'))){
                    unknownUsers.add(String.valueOf((Integer)empMap.get('uid')));
                }
            }
        }

        // callout for time entries
        HttpRequest entriesRequest    = togglAuth(
                '/reports/api/v2/details?workspace_id=' + System.Label.TogglWorkspaceId + '&' +
                        'since=' + String.valueOf(Date.today().addDays(-10)) + '' +
                        '&until=' + String.valueOf(Date.today()) +
                        '&user_agent=535104bb8ec99db2e0718f65e04e1579',
                'GET');
        HttpResponse entriesResponse  = Test.isRunningTest() ? MockHandler.getTogglEntriesMock() : new Http().send(entriesRequest);

        // before inserting time entries, update employee records
        update employeeMap.values();

        if (entriesResponse.getStatusCode() == 200){

            // new list of time entries to upsert
            List<TimeEntry__c> entries  = new List<TimeEntry__c>();
            Set<Id> affectedOppIds      = new Set<Id>();
            Set<String> unassignedIds   = new Set<String>();

            Map<String,Object> dataMap = (Map<String,Object>)JSON.deserializeUntyped(entriesResponse.getBody());

            if (dataMap.containsKey('data')){

                List<Object> dataList = (List<Object>)dataMap.get('data');

                for (Object entryObj : dataList){

                    Map<String,Object> objMap = (Map<String,Object>)entryObj;

                    if (oppIdMap.containsKey(String.valueOf((Integer)objMap.get('pid')))
                            && objMap.get('start') != null && objMap.get('end') != null){

                        TimeEntry__c entry = new TimeEntry__c();
                        entry.Opportunity__c            = oppIdMap.get(String.valueOf((Integer)objMap.get('pid')));
                        entry.Employee__r               = !unknownUsers.contains(String.valueOf(objMap.get('uid'))) ?
                                                            new Employee1__c(TogglId__c = String.valueOf(objMap.get('uid'))) : null;
                        entry.Start__c                  = (Datetime)JSON.deserialize('"' + String.valueOf(objMap.get('start')) + '"', Datetime.class);
                        entry.End__c                    = (Datetime)JSON.deserialize('"' + String.valueOf(objMap.get('end')) + '"', Datetime.class);
                        entry.Duration__c               = Integer.valueOf(objMap.get('dur'));
                        entry.TogglId__c                = String.valueOf(objMap.get('id'));
                        entry.Description__c            = String.valueOf(objMap.get('description'));
                        entry.TagName__c                = '';

                        List<Object> tagObjs = (List<Object>)objMap.get('tags');

                        if (!tagObjs.isEmpty()){
                            affectedOppIds.add(oppIdMap.get(String.valueOf((Integer)objMap.get('pid'))));
                            List<String> tags = new List<String>();
                            for (Object tagObj : tagObjs) tags.add((String)tagObj);
                            entry.TagName__c = String.join(tags,', ');
                        }

                        entries.add(entry);
                        unassignedIds.add(String.valueOf(objMap.get('id')));
                    }
                }
            }

            if (!affectedOppIds.isEmpty()){

                Map<String,Map<String,String>> oppLineMap = getOppLineMap(affectedOppIds);
                unassignedIds = getUnassignedEntries(unassignedIds);

                for (TimeEntry__c entry : entries){

                    String tag = entry.TagName__c.split(',')[0];

                    system.debug('when id is ' + entry.TogglId__c +  ' tag id is ' + tag +
                    ' and ' + unassignedIds.contains(tag) + ' ' + oppLineMap.containsKey(entry.Opportunity__c));



                    if (unassignedIds.contains(entry.TogglId__c) &&
                            oppLineMap.containsKey(entry.Opportunity__c) &&
                            oppLineMap.get(entry.Opportunity__c).containsKey(tag)){
                        entry.Quote_Line__c = oppLineMap.get(entry.Opportunity__c).get(tag);
                        entry.Assigned__c   = true;
                    }
                }
            }

            Schema.SObjectField togglId = TimeEntry__c.fields.TogglId__c;

            Database.UpsertResult [] upsertResults = Database.upsert(entries, togglId, false);
        }
    }


    @TestVisible
    private static HttpRequest togglAuth(String endpoint, String method){

        String code             = System.Label.TogglAPIToken + ':api_token';
        Blob codeBlob           = Blob.valueOf(code);
        String personalEncode   = EncodingUtil.base64Encode(codeBlob);
        HttpRequest req         = new HttpRequest();

        req.setEndpoint('https://www.toggl.com/' + endpoint);
        req.setHeader('Content-Type','application/json');
        req.setHeader('Authorization', 'Basic ' + personalEncode);
        req.setMethod(method);
        return req;
    }

    @TestVisible
    private static String getPostResponseId(HttpResponse response){
        Map<String,Object> resMap = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        Map<String,Object> data   = (Map<String,Object>)resMap.get('data');
        return String.valueOf((Integer)data.get('id'));
    }

    @TestVisible
    private static Map<String,Employee1__c> getEmployeeMap(){

        Map<String,Employee1__c> employeeMap = new Map<String,Employee1__c>();
        for (Employee1__c emp : [SELECT Id, TogglId__c, Email__c FROM Employee1__c WHERE Email__c != NULL]){
            employeeMap.put(emp.Email__c,emp);
        }

        return employeeMap;
    }

    @TestVisible
    private static Map<String,String> getOppExternalIds(){

        Map<String,String> idMap = new Map<String,String>();
        for (Opportunity opp : [SELECT Id, TogglId__c FROM Opportunity WHERE TogglId__c != NULL]){
            idMap.put(opp.TogglId__c,opp.Id);
        }

        return idMap;
    }

    @TestVisible
    private static Map<String,Map<String,String>> getOppLineMap(Set<Id> oppIds){

        Map<String,Map<String,String>> oppLineMap = new Map<String,Map<String,String>>();

        for (SBQQ__QuoteLine__c line : [SELECT Id, SBQQ__Product__r.Name, SBQQ__Quote__r.SBQQ__Opportunity2__c
                                        FROM SBQQ__QuoteLine__c
                                        WHERE SBQQ__Quote__r.SBQQ__Primary__c = TRUE
                                        AND SBQQ__Product__r.Name != NULL
                                        AND SBQQ__Quote__r.SBQQ__Opportunity2__c IN :oppIds]){

            if (!oppLineMap.containsKey(line.SBQQ__Quote__r.SBQQ__Opportunity2__c)){
                oppLineMap.put(line.SBQQ__Quote__r.SBQQ__Opportunity2__c, new Map<String,String>());
            }
            oppLineMap.get(line.SBQQ__Quote__r.SBQQ__Opportunity2__c).put(line.SBQQ__Product__r.Name, line.Id);

        }

        return oppLineMap;
    }

    @TestVisible
    private static Set<String> getUnassignedEntries(Set<String> allIds){

        for (TimeEntry__c entry : [SELECT Id, TogglId__c FROM TimeEntry__c WHERE Assigned__c = TRUE AND TogglId__c IN :allIds]){
            allIds.remove(entry.TogglId__c);
        }

        return allIds;
    }

}