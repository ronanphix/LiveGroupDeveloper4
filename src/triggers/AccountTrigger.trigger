/**
 * Created by ronanwilliams on 2019-12-30.
 */

trigger AccountTrigger on Account (after insert, after update) {

<<<<<<< HEAD
    if (Trigger.new.size() == 1 && !System.isFuture()){
=======
    if (Trigger.new.size() == 1){
>>>>>>> c7bba63c22a90b7c7191f21ae970d661f867f8b0
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