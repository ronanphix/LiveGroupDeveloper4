/**
 * Created by ronanwilliams on 2019-11-18.
 */

trigger ProductTrigger on Product2 (after insert, after update) {

    if (Trigger.isAfter){
        if (Trigger.isInsert){
            ProductTriggerHandler.handleAfterInsert(Trigger.new);
        }
        if (Trigger.isUpdate){
            ProductTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}