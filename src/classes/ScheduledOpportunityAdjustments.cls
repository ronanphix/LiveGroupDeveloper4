/**
 * Created by Ronan Williams on 14/11/2018.
 */

public with sharing class ScheduledOpportunityAdjustments implements Schedulable {

    public void execute(SchedulableContext ctx) {
        SalesDashboardUtils.adjustOpportunities();
<<<<<<< HEAD
//        SalesDashboardUtils.adjustCalderCommissions();
=======
>>>>>>> c7bba63c22a90b7c7191f21ae970d661f867f8b0
    }
}