/**
 * Created by ronanwilliams on 2019-11-14.
 */

public class TogglCallout {

    // batch post account to client



    // batch post opportunity to project


    // single post account to client
//    @Future(Callout=true)
    public static void postAccount(Id accountId){

        Account account = [SELECT Name, TogglId__c FROM Account WHERE Id = :accountId];

        HttpRequest req = togglAuth('clients', 'POST');
        req.setBody('{"client":{"name":"' + account.Name + '","wid":3375044}}');

        system.debug(req.getBody());

        HttpResponse res  = Test.isRunningTest() ? MockHandler.getTogglClientMock() : new Http().send(req);

        if (res.getStatusCode() == 200){

            Map<String,Object> resMap = (Map<String,Object>)JSON.deserializeUntyped(res.getBody());
            Map<String,Object> data   = (Map<String,Object>)resMap.get('data');
            account.TogglId__c        = String.valueOf((Integer)data.get('id'));
            update account;
        }



        system.debug(res.getStatusCode());
        system.debug(res.getBody());



    }


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
            clientId = clientResponse.getStatusCode() == 200 ? getResponseId(clientResponse) : null;
        }

        HttpRequest projectRequest = togglAuth('projects', 'POST');
        projectRequest.setBody('{"project":{"name":"' + opp.Filtered_Job_Number__c + ' ' +
                                opp.Name + '","wid":3375044,"is_private":false,"cid":' + clientId + '}}');
        HttpResponse projectResponse  = Test.isRunningTest() ? MockHandler.getTogglProjectMock() : new Http().send(projectRequest);
        projectId = projectResponse.getStatusCode() == 200 ? getResponseId(projectResponse) : null;

        if (clientId != opp.Account.TogglId__c){
            update new Account(Id = opp.AccountId, TogglId__c = clientId);
        }

        opp.TogglId__c = projectId;
        update opp;

    }


    // get time entries on sync

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
    private static String getResponseId(HttpResponse response){
        Map<String,Object> resMap = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        Map<String,Object> data   = (Map<String,Object>)resMap.get('data');
        return String.valueOf((Integer)data.get('id'));
    }











}