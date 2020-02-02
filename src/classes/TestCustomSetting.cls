/**
 * Created by ronanwilliams on 2019-08-07.
 */


@IsTest
public with sharing class TestCustomSetting {

    @IsTest
    public static void testNoCustomSetting(){

        insert new Opportunity(Name='Test',StageName='Costed prospect',CloseDate=Date.today());


    }


}