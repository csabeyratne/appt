global class ErrorUtils {

    global static void handleError(Exception e){
        if(e != null){
            handleError(
                'An error occurred in salesforce.com for ' 
                    + UserInfo.getOrganizationName() 
                    + ' (' 
                    + UserInfo.getOrganizationId()
                    + ')', 
                'An error occurred in salesforce.com.\n\n'
                    + 'User: '
                    + UserInfo.getName()
                    + ' (' 
                    + UserInfo.getUserName() 
                    + ',' 
                    + UserInfo.getUserId()
                    + ')\nOrganization: ' 
                    + UserInfo.getOrganizationName() 
                    + ' (' 
                    + UserInfo.getOrganizationId()
                    + ')\nDate/time: '
                    + Datetime.now()
                    + '\n\nError:\n\n' 
                    + e.getMessage()
            );
        }
    }

    global static void handleError(String summary, String description){
        final Map<String,Custom_Code_Support_Email__c> supportEmails = Custom_Code_Support_Email__c.getAll();
        if(supportEmails != null && !supportEmails.isEmpty()){
            Set<String> emails = new Set<String>();
            for(Custom_Code_Support_Email__c supportEmail : supportEmails.values()){
                emails.add(supportEmail.Email__c);
            }
            if(emails != null && emails.size() > 0){
                final Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();        
                mail.setSaveAsActivity(false);
                mail.setToAddresses(setToList(emails));          
                mail.setSubject(summary);
                mail.setBccSender(false);
                mail.setUseSignature(false);
                mail.setPlainTextBody(description);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
        }
    }

    global static Custom_Code_Support_Email__c ensureCustomCodeSupportEmailExists(Custom_Code_Support_Email__c record){
        if(record == null 
           || isBlank(record.Email__c)){
           record = null;     
        } else {
            Custom_Code_Support_Email__c queried = null;
            try{
                queried = [   
                    select id 
                    from Custom_Code_Support_Email__c 
                    where Email__c = :record.Email__c
                ];
            }catch(QueryException e){}
            if(queried != null && queried.id != record.id){
                delete queried;
            }
            if(record.id != null){
                update record;
            } else {
                insert record;
            }
        }
        return record;
    } 

    private static boolean isBlank(String str) {
        return str == null || str.trim() == null || str.trim().length() == 0;
    }

    private static List<String> setToList(Set<String> aSet){
        List<String> returnValue = null;
        if(aSet != null){
            returnValue = new List<String>();
            if(aSet.size() > 0){
                for(String value : aSet){
                    returnValue.add(value);
                }
            }
        }
        return returnValue;
    }

}