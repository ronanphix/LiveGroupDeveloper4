/**
 * Created by ronanwilliams on 2019-11-15.
 */

({
    doInit : function(component, event, helper) {

    },
    closeAllocate : function(component, event, helper){
        component.set('v.allocating',false);
    },
    dragOver : function(component, event, helper){
        event.preventDefault();
    },
    dragLeave : function(component, event, helper){
        //console.log('dragg leave');
    },
    drop : function(component, event, helper){
        var dropEvent = $A.get("e.c:TimeEntryDrop");
        dropEvent.setParams({ lineId : null});
        dropEvent.fire();
    },
})