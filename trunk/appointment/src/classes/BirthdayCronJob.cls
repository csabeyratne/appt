global class BirthdayCronJob implements Schedulable {
    
        //mandataory function called by the Apex Scheduler
        global void execute(SchedulableContext SC) {
            sendmail(); // our main function that does the email sending
        }//end execute()
         
        //Get email addresses of people wiht birthdays 
        public List<Id> getEmailAddresses(Integer Month, Integer Day) 
        {
        
            System.Debug('## >>> getEmailAddresses() START run by ');

            List<Id> mailToIds = new List<Id>();
        
            //find a list of contacts with birthdays today, and who have not opted out of email
            Contact[] c = [SELECT Id, email, Birthdate 
                            FROM Contact 
                            WHERE DAY_IN_MONTH(Birthdate) = : Day 
                            AND CALENDAR_MONTH(Birthdate) = : Month                         
                            AND HasOptedOutOfEmail = false];
        
            //add the list of contacts to a list        
            for(Contact recipient : c) {
                mailToIds.add(recipient.Id);
            }

            System.Debug('## >>> getEmailAddresses() END run by ' + mailToIds);

            //return the list
            return mailToIds;

        }//end getEmailAddresses()


        public void sendMail() {
        
            System.Debug('## >>> sendMail() START run by ' + UserInfo.getName());
    
            //define variables          
            String debugAddress = 'mdl@appointment-time.com';
            String temp = 'Happy Birthday';
            String debugMessage;
            String[] toAddresses;

            Integer DayOfEvent   = date.today().day();
            Integer MonthOfEvent = date.today().month();

            //get the list of people with birthdays - this can justifiably come back empty, on a day when no contacts were born 
            List<Id> BirthdayIdsList = getEmailAddresses(MonthOfEvent,DayOfEvent);
        
            //Set the template
            EmailTemplate birthdayTemplate = [select Id,Name,Subject,body from EmailTemplate where name like :temp+'%'];

            //If we have a template, and we have a list of email addresses, then send the email
            if(birthdayTemplate != null || BirthdayIdsList==null)
            {

                Messaging.MassEmailMessage birthdayMail = new Messaging.MassEmailMessage();
    
                birthdayMail.setTargetObjectIds(BirthdayIdsList);
                birthdayMail.setTemplateId(birthdayTemplate.Id);
                birthdayMail.setUseSignature(false);
                birthdayMail.setSaveAsActivity(true);

                // Send the email
                try {
                Messaging.sendEmail(new Messaging.MassEmailMessage[] { birthdayMail });
                }catch(Exception e)
                {
                    System.Debug(e);
                }
           
            }
            else
            {
                System.Debug('BirthdayCronJob:sendMail(): Either an email template could not be found, or no Contact has a birthday today');
            }//end if

            System.Debug('## >>> sendMail() END run by ' + UserInfo.getName());
                
        }//end sendMail() 
    
}//end class BirthdayCronJob