/**
 * Created by ronanwilliams on 2019-11-19.
 */

@IsTest
public class TogglCalloutTest {

    @TestSetup
    public static void doTestSetup(){

        // insert one Employee1__c record
        Employee1__c emp    = new Employee1__c();
        emp.FirstName__c    = 'Test';
        emp.LastName__c     = 'Test';
        emp.Email__c        = 'test@test.com';
        emp.Active__c       = true;
        insert emp;

        // create and insert account
        Account acc         = new Account();
        acc.Name            = 'TestClient';
        insert acc;

        // create and insert opportunity
        Opportunity opp     = new Opportunity();
        opp.Name            = 'TestProject';
        opp.CloseDate       = Date.today();
        opp.StageName       = 'Costed prospect';
        opp.Amount          = 1;
        opp.AccountId       = acc.Id;
        opp.Invoice_Schedule__c = 'Single post-event invoice';
        opp.Event_start__c  = Date.today();
        opp.Event_end__c    = Date.today();
        opp.TogglId__c      = '1';
        insert opp;

        opp.StageName   = 'Closed Won';
        update opp;

    }



    @IsTest
    public static void testProjectPost(){

        // create and insert account
        Account acc         = new Account();
        acc.Name            = 'TestClient';
        insert acc;

        // create and insert opportunity
        Opportunity opp     = new Opportunity();
        opp.Name            = 'TestProject';
        opp.CloseDate       = Date.today();
        opp.StageName       = 'Costed prospect';
        opp.Amount          = 1;
        opp.AccountId       = acc.Id;
        opp.Invoice_Schedule__c = 'Single post-event invoice';
        opp.Event_start__c  = Date.today();
        opp.Event_end__c    = Date.today();
        insert opp;

        Test.startTest();
        opp.StageName   = 'Closed Won';
        update opp;
        Test.stopTest();

        System.assertEquals('1',[SELECT Id, TogglId__c FROM Account WHERE Id = :acc.Id].TogglId__c);
        System.assertEquals('1',[SELECT Id, TogglId__c FROM Opportunity WHERE Id = :opp.Id].TogglId__c);
    }

    @IsTest
    public static void testTagPostOnInsert(){

        // insert product with correct criteria to be posted to Toggl
        Product2 prod   = new Product2();
        prod.Name       = 'TestTag';
        prod.IsActive   = true;
        prod.SBQQ__SubscriptionTerm__c = 1;

        Test.startTest();
        insert prod;
        Test.stopTest();

        System.assertEquals('1',[SELECT Id, TogglId__c FROM Product2 WHERE Id = :prod.Id].TogglId__c);
    }

    @IsTest
    public static void testTagPostOnUpdate(){

        // insert product with correct criteria to be posted to Toggl
        Product2 prod   = new Product2();
        prod.Name       = 'TestTag';
        prod.SBQQ__SubscriptionTerm__c = 1;
        insert prod;

        Test.startTest();
        prod.IsActive   = true;
        update prod;
        Test.stopTest();

        System.assertEquals('1',[SELECT Id, TogglId__c FROM Product2 WHERE Id = :prod.Id].TogglId__c);
    }


    @IsTest
    public static void testGetTimeEntries(){

        // get time entries
        Test.startTest();
        TogglCallout.getTimeEntries();
        Test.stopTest();

        System.assertEquals(2, [SELECT Id FROM TimeEntry__c].size());

    }

    @IsTest
    public static void testSchedule(){
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',
                '0 0 0 15 3 ? 2022',
                new ScheduledTogglCallout());
        Test.stopTest();
    }

}