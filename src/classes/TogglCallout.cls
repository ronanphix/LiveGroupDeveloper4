/**
 * Created by ronanwilliams on 2019-11-14.
 */

public class TogglCallout {

    // batch post account to client



    // batch post opportunity to project



    // single post opportunity to project
    @Future(Callout=true)
    public static void postProject(Id oppId){

        Opportunity opp  = [SELECT Name, TogglId__c, AccountId, Account.Name,
                            Account.TogglId__c, Filtered_Job_Number__c
                            FROM Opportunity WHERE Id = :oppId];
        String clientId  = opp.Account.TogglId__c;
        String projectId = opp.TogglId__c;

        if (clientId == null){
            HttpRequest clientRequest = togglAuth('clients', 'POST');
            clientRequest.setBody('{"client":{"name":"' + opp.Account.Name + '","wid":3375044}}');
            HttpResponse clientResponse  = Test.isRunningTest() ? MockHandler.getTogglClientMock() : new Http().send(clientRequest);
            clientId = clientResponse.getStatusCode() == 200 ? getPostResponseId(clientResponse) : null;
        }

        HttpRequest projectRequest = togglAuth('projects', 'POST');
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


    // get time entries on sync

    public static void getTimeEntries(){

        // get map of all users by email
        Map<String,Employee1__c> employeeMap = getEmployeeMap();

        HttpRequest usersRequest    = togglAuth('workspaces/3375044/workspace_users', 'GET');
        HttpResponse usersResponse  = Test.isRunningTest() ? MockHandler.getTogglClientMock() : new Http().send(usersRequest);

        if (usersResponse.getStatusCode() == 200){
            List<Object> employees = (List<Object>)JSON.deserializeUntyped(usersResponse.getBody());

            for (Object employee : employees){
                Map<String,Object> empMap = (Map<String,Object>)employee;
                if (employeeMap.containsKey((String)empMap.get('email')) &&
                        String.valueOf((Integer)empMap.get('uid')) != employeeMap.get((String)empMap.get('email')).TogglId__c){
                    employeeMap.get((String)empMap.get('email')).TogglId__c = String.valueOf((Integer)empMap.get('uid'));
                    system.debug('updated ' + employeeMap.get((String)empMap.get('email')).TogglId__c);
                }
            }

        }

        // callout for time entries
        HttpRequest entriesRequest    = togglAuth(
                'time_entries?start_date=2019-11-10T15%3A42%3A46%2B02%3A00&end_date=2019-11-14T15%3A42%3A46%2B02%3A00',
                'GET');
        HttpResponse entriesResponse  = Test.isRunningTest() ? MockHandler.getTogglClientMock() : new Http().send(entriesRequest);

        system.debug('entries response' + entriesResponse.getBody());

        // before inserting time entries, update employee records
        update employeeMap.values();


        // then upsert time entries


        system.debug(usersResponse.getStatusCode());
        system.debug(usersResponse.getBody());

    }


    // custom obj: TimeEntry__c


    @TestVisible
    private static HttpRequest togglAuth(String endpoint, String method){

        String code             = '535104bb8ec99db2e0718f65e04e1579:api_token';
        Blob codeBlob           = Blob.valueOf(code);
        String personalEncode   = EncodingUtil.base64Encode(codeBlob);
        HttpRequest req         = new HttpRequest();

        req.setEndpoint('https://www.toggl.com/api/v8/' + endpoint);
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
            system.debug('toggl id is ' + emp.TogglId__c);
        }

        return employeeMap;
    }











}