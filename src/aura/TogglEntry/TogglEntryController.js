/**
 * Created by ronanwilliams on 2019-11-15.
 */

({
    dragEntry : function(component, event, helper) {

        event.stopPropagation();
        var dragEvent = $A.get("e.c:TimeEntryDrag");
        dragEvent.setParams({ entryId : component.get('v.entry.Id')});
        dragEvent.fire();

        var transferData = '{"type":"TimeEntry"}';

        event.dataTransfer.setData("text/plain", transferData);

    }
})