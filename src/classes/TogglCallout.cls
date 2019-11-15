/**
 * Created by ronanwilliams on 2019-11-14.
 */

public class TogglCallout {

//    // single post opportunity to project
//    @Future(Callout=true)
//    public static void postProject(Id oppId){
//
//        Opportunity opp  = [SELECT Name, TogglId__c, AccountId, Account.Name,
//                            Account.TogglId__c, Filtered_Job_Number__c
//                            FROM Opportunity WHERE Id = :oppId];
//        String clientId  = opp.Account.TogglId__c;
//        String projectId = opp.TogglId__c;
//
//        if (clientId == null){
//            HttpRequest clientRequest = togglAuth('api/v8/clients', 'POST');
//            clientRequest.setBody('{"client":{"name":"' + opp.Account.Name + '","wid":3375044}}');
//            HttpResponse clientResponse  = Test.isRunningTest() ? MockHandler.getTogglClientMock() : new Http().send(clientRequest);
//            clientId = clientResponse.getStatusCode() == 200 ? getPostResponseId(clientResponse) : null;
//        }
//
//        HttpRequest projectRequest = togglAuth('api/v8/projects', 'POST');
//        projectRequest.setBody('{"project":{"name":"' + opp.Filtered_Job_Number__c + ' ' +
//                                opp.Name + '","wid":3375044,"is_private":false,"cid":' + clientId + '}}');
//        HttpResponse projectResponse  = Test.isRunningTest() ? MockHandler.getTogglProjectMock() : new Http().send(projectRequest);
//        projectId = projectResponse.getStatusCode() == 200 ? getPostResponseId(projectResponse) : null;
//
//        if (clientId != opp.Account.TogglId__c){
//            update new Account(Id = opp.AccountId, TogglId__c = clientId);
//        }
//
//        opp.TogglId__c = projectId;
//        update opp;
//
//    }
//
//
//    // get time entries on sync
//
//    public static void getTimeEntries(){
//
//        // get map of all users by email
//        Map<String,Employee1__c> employeeMap = getEmployeeMap();
//        Set<String> unknownUsers = new Set<String>();
//
//        Map<String,String> idEmailMap  = new Map<String,String>();
//
//        // get set of all Opportunity external Ids
//        Map<String,String> oppIdMap = getOppExternalIds();
//
//        HttpRequest usersRequest    = togglAuth('api/v8/workspaces/3375044/workspace_users', 'GET');
//        HttpResponse usersResponse  = Test.isRunningTest() ? MockHandler.getUsersMock() : new Http().send(usersRequest);
//
//        if (usersResponse.getStatusCode() == 200){
//            List<Object> employees = (List<Object>)JSON.deserializeUntyped(usersResponse.getBody());
//
//            for (Object employee : employees){
//                Map<String,Object> empMap = (Map<String,Object>)employee;
//
//                if (employeeMap.containsKey((String)empMap.get('email')) &&
//                        String.valueOf((Integer)empMap.get('uid')) != employeeMap.get((String)empMap.get('email')).TogglId__c){
//                    employeeMap.get((String)empMap.get('email')).TogglId__c = String.valueOf((Integer)empMap.get('uid'));
//                    idEmailMap.put(String.valueOf((Integer)empMap.get('uid')),(String)empMap.get('email'));
//                } else if (!employeeMap.containsKey((String)empMap.get('email'))){
//                    unknownUsers.add(String.valueOf((Integer)empMap.get('uid')));
//                    system.debug('adding unknown user ' + empMap.get('uid'));
//                }
//            }
//        }
//
//        // callout for time entries
//        HttpRequest entriesRequest    = togglAuth(
//                '/reports/api/v2/details?workspace_id=3375044&since=2019-01-01&until=2019-12-01&user_agent=535104bb8ec99db2e0718f65e04e1579',
//                'GET');
//        HttpResponse entriesResponse  = Test.isRunningTest() ? MockHandler.getTogglClientMock() : new Http().send(entriesRequest);
//
//        // before inserting time entries, update employee records
//        update employeeMap.values();
//
//        if (entriesResponse.getStatusCode() == 200){
//
//            // new list of time entries to upsert
//            List<TimeEntry__c> entries = new List<TimeEntry__c>();
//
//            Map<String,Object> dataMap = (Map<String,Object>)JSON.deserializeUntyped(entriesResponse.getBody());
//
//            if (dataMap.containsKey('data')){
//
//                List<Object> dataList = (List<Object>)dataMap.get('data');
//
//                for (Object entryObj : dataList){
//                    Map<String,Object> objMap = (Map<String,Object>)entryObj;
//
//                    if (oppIdMap.containsKey(String.valueOf((Integer)objMap.get('pid')))
//                            && objMap.get('start') != null && objMap.get('end') != null){
//
//                        TimeEntry__c entry = new TimeEntry__c();
//                        entry.Opportunity__c            = oppIdMap.get(String.valueOf((Integer)objMap.get('pid')));
//                        entry.Employee__r               = !unknownUsers.contains(String.valueOf(objMap.get('uid'))) ?
//                                                            new Employee1__c(TogglId__c = String.valueOf(objMap.get('uid'))) : null;
//                        entry.Start__c                  = (Datetime)JSON.deserialize('"' + String.valueOf(objMap.get('start')) + '"', Datetime.class);
//                        entry.End__c                    = (Datetime)JSON.deserialize('"' + String.valueOf(objMap.get('end')) + '"', Datetime.class);
//                        entry.Duration__c               = Integer.valueOf(objMap.get('dur'));
//                        entry.TogglId__c                = String.valueOf(objMap.get('id'));
//                        entry.Description__c            = String.valueOf(objMap.get('description'));
//                        entries.add(entry);
//                    }
//                }
//            }
//
//            Schema.SObjectField togglId = TimeEntry__c.fields.TogglId__c;
//
//            Database.UpsertResult [] upsertResults = Database.upsert(entries, togglId, false);
//        }
//    }
//
//
//    @TestVisible
//    private static HttpRequest togglAuth(String endpoint, String method){
//
//        String code             = '535104bb8ec99db2e0718f65e04e1579:api_token';
//        Blob codeBlob           = Blob.valueOf(code);
//        String personalEncode   = EncodingUtil.base64Encode(codeBlob);
//        HttpRequest req         = new HttpRequest();
//
//        req.setEndpoint('https://www.toggl.com/' + endpoint);
//        req.setHeader('Content-Type','application/json');
//        req.setHeader('Authorization', 'Basic ' + personalEncode);
//        req.setMethod(method);
//        return req;
//    }
//
//    @TestVisible
//    private static String getPostResponseId(HttpResponse response){
//        Map<String,Object> resMap = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
//        Map<String,Object> data   = (Map<String,Object>)resMap.get('data');
//        return String.valueOf((Integer)data.get('id'));
//    }
//
//    @TestVisible
//    private static Map<String,Employee1__c> getEmployeeMap(){
//
//        Map<String,Employee1__c> employeeMap = new Map<String,Employee1__c>();
//        for (Employee1__c emp : [SELECT Id, TogglId__c, Email__c FROM Employee1__c WHERE Email__c != NULL]){
//            employeeMap.put(emp.Email__c,emp);
//        }
//
//        return employeeMap;
//    }
//
//    @TestVisible
//    private static Map<String,String> getOppExternalIds(){
//
//        Map<String,String> idMap = new Map<String,String>();
//        for (Opportunity opp : [SELECT Id, TogglId__c FROM Opportunity WHERE TogglId__c != NULL]){
//            idMap.put(opp.TogglId__c,opp.Id);
//        }
//
//        return idMap;
//    }
}