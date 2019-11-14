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

}