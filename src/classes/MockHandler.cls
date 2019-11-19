/**
 * Created by ronanwilliams on 2019-11-14.
 */

public class MockHandler {

    public static HttpResponse getTogglClientMock(){

        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('{"data":{"name":"TestClient","wid":3375044,"id":1}}');
        return res;

    }

    public static HttpResponse getTogglProjectMock(){

        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('{"data":{"name":"TestProject","wid":3375044,"id":1}}');
        return res;

    }

    public static HttpResponse getTogglTagMock(){

        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('{"data":{"id":1,"wid":3375044,"name":"TestTag"}}');
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
                '"email":"test@test.com","timezone":"Europe/London","inactive":false,' +
                '"at":"2019-04-17T09:23:50+00:00","name":"Ronan Williams","group_ids":null,' +
                '"rate":null,"labour_cost":null,"invite_url":null,"invitation_code":null,"avatar_file_name":null}]'

        );
        return res;

    }

    public static HttpResponse getEntriesMock(){

        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody(
                '{"total_grand":415866000,"total_billable":null,"total_currencies":[{"currency":null,"amount":null}],' +
                '"total_count":19,"per_page":50,"data":[{"id":1365070171,"pid":155350599,"tid":null,"uid":4782855,' +
                '"description":"","start":"2019-11-18T13:07:35+00:00","end":"2019-11-18T13:07:41+00:00","updated":' +
                '"2019-11-18T13:07:41+00:00","dur":6000,"user":"Ronan Williams","use_stop":true,"client":"Ernst & Young LLP",' +
                '"project":"19214 togglTest2","project_color":"0","project_hex_color":"#205500","task":null,"billable":null,' +
                '"is_billable":false,"cur":null,"tags":["18 tonne truck"]},{"id":1365069533,"pid":155350599,"tid":null,' +
                '"uid":4782855,"description":"","start":"2019-11-18T13:07:06+00:00","end":"2019-11-18T13:07:06+00:00",' +
                '"updated":"2019-11-18T13:07:20+00:00","dur":0,"user":"Ronan Williams","use_stop":true,"client":"Ernst & Young LLP",' +
                '"project":"19214 togglTest2","project_color":"0","project_hex_color":"#205500","task":null,"billable":null,' +
                '"is_billable":false,"cur":null,"tags":["18 tonne truck"]},{"id":1365069518,"pid":155350599,"tid":null,' +
                '"uid":4782855,"description":"","start":"2019-11-18T13:07:06+00:00","end":"2019-11-18T13:07:06+00:00",' +
                '"updated":"2019-11-18T13:07:20+00:00","dur":0,"user":"Ronan Williams","use_stop":true,"client":' +
                '"Ernst & Young LLP","project":"19214 togglTest2","project_color":"0","project_hex_color":"#205500",' +
                '"task":null,"billable":null,"is_billable":false,"cur":null,"tags":["18 tonne truck"]},{"id":1365070310,' +
                '"pid":155350599,"tid":null,"uid":4782855,"description":"","start":"2019-11-18T01:07:41+00:00","end":' +
                '"2019-11-18T13:08:01+00:00","updated":"2019-11-18T13:08:01+00:00","dur":43220000,"user":"Ronan Williams",' +
                '"use_stop":true,"client":"Ernst & Young LLP","project":"19214 togglTest2","project_color":"0",' +
                '"project_hex_color":"#205500","task":null,"billable":null,"is_billable":false,"cur":null,"tags":["18 tonne truck"]},' +
                '{"id":1363325896,"pid":null,"tid":null,"uid":4952567,"description":"","start":"2019-11-15T12:44:02+00:00",' +
                '"end":"2019-11-15T12:44:03+00:00","updated":"2019-11-15T12:44:03+00:00","dur":1000,"user":"Alina Tursunova",' +
                '"use_stop":true,"client":null,"project":null,"project_color":"0","project_hex_color":null,"task":null,' +
                '"billable":null,"is_billable":false,"cur":null,"tags":[]},{"id":1363300570,"pid":155350574,"tid":null,' +
                '"uid":4782855,"description":"bringing sexy back","start":"2019-11-15T12:19:26+00:00","end":"2019-11-15T12:29:34+00:00",' +
                '"updated":"2019-11-18T13:02:56+00:00","dur":608000,"user":"Ronan Williams","use_stop":true,"client":"Ernst & Young LLP",' +
                '"project":"19212 togglTest1","project_color":"0","project_hex_color":"#e20505","task":null,"billable":null,"is_billable":' +
                'false,"cur":null,"tags":["Videoconference bridge"]}]}'

        );
        return res;

    }

}