/**
 * Created by ronanwilliams on 2019-11-14.
 */

public class MockHandler {



    public static HttpResponse getTogglClientMock(){

        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('{"client":{"name":"Capita","wid":3375044}}');
        return res;

    }

    public static HttpResponse getTogglProjectMock(){

        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('{"client":{"name":"Capita","wid":3375044}}');
        return res;

    }

    public static HttpResponse getUsersMock(){

        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody(
                '[{"id":5027070,"uid":4862279,"wid":3375044,"admin":false,"owner":false,"active":true,' +
                '"email":"ronanjwilliams@gmail.com","timezone":"Europe/London",' +
                '"inactive":false,"at":"2019-05-24T15:41:30+00:00","name":"Ronanjwilliams",' +
                '"group_ids":null,"rate":null,"labour_cost":null,"invite_url":null,' +
                '"invitation_code":null,"avatar_file_name":null},' +
                '{"id":4932527,"uid":4782855,"wid":3375044,"admin":true,"owner":true,"active":true,' +
                '"email":"ronan.williams@livegroup.co.uk","timezone":"Europe/London","inactive":false,' +
                '"at":"2019-04-17T09:23:50+00:00","name":"Ronan Williams","group_ids":null,' +
                '"rate":null,"labour_cost":null,"invite_url":null,"invitation_code":null,"avatar_file_name":null}]'

        );
        return res;

    }

}