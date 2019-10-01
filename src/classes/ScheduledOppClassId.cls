/**
 * Created by ronanwilliams on 2019-09-15.
 */

public class ScheduledOppClassId implements Schedulable {
    public void execute(SchedulableContext ctx) {
        QuickbooksClassSync.refreshClassSync(new Map<String,String>());
    }
}

