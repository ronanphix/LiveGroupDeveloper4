/**
 * Created by ronanwilliams on 2019-11-20.
 */

public class ScheduledTogglCallout implements Schedulable {

    public void execute(SchedulableContext ctx) {

        // call Toggl for time entries
        TogglCallout.getTimeEntries();

    }

}