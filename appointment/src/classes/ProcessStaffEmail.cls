global class ProcessStaffEmail implements Messaging.InboundEmailHandler {
 
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
 
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
 
        Staff__c staff = new Staff__c();
        staff.First_Name__c = email.fromname.substring(0,email.fromname.indexOf(' '));
        staff.Last_Name__c = email.fromname.substring(email.fromname.indexOf(' '));
        staff.Email__c = envelope.fromAddress;
        insert staff;
 
        System.debug('====> Created staff '+staff.Id);
 
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {

            for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
                Attachment attachment = new Attachment();
                // attach to the newly created staff record
                attachment.ParentId = staff.Id;
                attachment.Name = email.binaryAttachments[i].filename;
                attachment.Body = email.binaryAttachments[i].body;
                insert attachment;
            }

        }
 
        return result;
 
    }

    static testMethod void testMe() {

        // create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
 
        // setup the data for the email
        email.subject = 'Test Job Applicant';
        email.fromname = 'FirstName LastName';
        env.fromAddress = 'someaddress@email.com';
 
        // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
 
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };
 
        // call the email service class and test it with the data in the testMethod
        ProcessStaffEmail emailProcess = new ProcessStaffEmail();
        emailProcess.handleInboundEmail(email, env);
 
        // query for the staff the email service created
        Staff__c staff = [select Id, First_Name__c, Last_Name__c, Email__c from Staff__c
          where First_Name__c = 'FirstName' and Last_Name__c = 'LastName'];
 
        System.assertEquals(staff.First_Name__c,'FirstName');
        System.assertEquals(staff.Last_Name__c,'LastName');
        System.assertEquals(staff.Email__c,'someaddress@email.com');
 
        // find the attachment
        Attachment a = [select name from attachment where parentId = :staff.id];
 
        System.assertEquals(a.name,'textfile.txt');
 
    }

}