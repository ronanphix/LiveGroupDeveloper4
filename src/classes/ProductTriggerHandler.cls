/**
 * Created by ronanwilliams on 2019-11-18.
 */

public class ProductTriggerHandler {

    public static void handleAfterInsert(List<Product2> triggerNew){

        Set<Id> productIds = new Set<Id>();

        for (Product2 product : triggerNew){
            if (product.IsActive && product.TogglId__c == null){
                productIds.add(product.Id);
            }
        }

        if (productIds.size() < 60){

        }

    }

    public static void handleAfterUpdate(List<Product2> triggerNew, Map<Id,Product2> triggerOldMap){

        Set<Id> productIds = new Set<Id>();

        for (Product2 product : triggerNew){
            if (product.TogglId__c == null && product.IsActive && !triggerOldMap.get(product.Id).IsActive){
                productIds.add(product.Id);
            }
        }
        if (productIds.size() < 60){

        }

    }



}