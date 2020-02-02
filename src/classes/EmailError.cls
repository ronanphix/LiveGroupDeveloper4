/**
 * Created by ronanwilliams on 2019-10-19.
 */

public with sharing class EmailError {

    public static void send(String subject, String body, List<String> toAddresses){

        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.senderDisplayName   = 'Salesforce';
        message.toAddresses         = toAddresses;
        message.subject             = subject;
        message.htmlBody            = body;
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{message};
        if (!Test.isRunningTest()) Messaging.sendEmail(messages);
    }
}