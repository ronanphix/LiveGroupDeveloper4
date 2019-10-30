/**
 * Created by ronanwilliams on 2019-10-19.
 */

public with sharing class EmailError {

    public static void send(String subject, String body){

        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses     = new String[] { 'ronan@ceterna.com',
                                                 'helen.kronheim@livegroup.co.uk',
                                                 'alina.tursonova@livegroup.co.uk',
                                                 'dee.simmonite@livegroup.co.uk'};
        message.subject         = subject;
        message.plainTextBody   = body;
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{message};
        Messaging.sendEmail(messages);
    }
}