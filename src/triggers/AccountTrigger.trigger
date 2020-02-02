/**
 * Created by ronanwilliams on 2019-12-30.
 */

trigger AccountTrigger on Account (after insert, after update) {

    if (Trigger.new.size() == 1 && !System.isFuture()){
        for (Account acc : Trigger.new){
            if (Trigger.isInsert){
                TogglCallout.postClient(acc.Id);
            }
            if (Trigger.isUpdate){
                if (acc.TogglId__c == null) TogglCallout.postClient(acc.Id);
            }
        }
    }
}