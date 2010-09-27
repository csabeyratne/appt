trigger StaffScheduleTrigger on Staff_Schedule__c (before insert, before update) {  

    if (!Utils.inFutureContext) { // Prevent recursive future method calls
    
        // System.Debug('## >>> StaffScheduleTrigger START run by ' + UserInfo.getName());

        // Create the instance of TriggerExt and call the constructor in our apex class  
        StaffScheduleTrigger triggerHandler = new StaffScheduleTrigger( new StaffScheduleExtTrigger(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap) );  
  
        // System.Debug('## >>> StaffScheduleTrigger - isBefore? ' + Trigger.isBefore);
        // System.Debug('## >>> StaffScheduleTrigger - isAfter? ' + Trigger.isAfter);
        // System.Debug('## >>> StaffScheduleTrigger - isInsert? ' + Trigger.isInsert);
        // System.Debug('## >>> StaffScheduleTrigger - isUpdate? ' + Trigger.isUpdate);
        // System.Debug('## >>> StaffScheduleTrigger - newValues ' + triggerHandler.MTrigger.newValues);
        // System.Debug('## >>> StaffScheduleTrigger - oldValues ' + triggerHandler.MTrigger.oldValues);
        // System.Debug('## >>> StaffScheduleTrigger - newMap ' + triggerHandler.MTrigger.newMap);
        // System.Debug('## >>> StaffScheduleTrigger - oldMap ' + triggerHandler.MTrigger.oldMap);
  
        if(Trigger.isBefore) {  
  
            // Now we set the attributes for our trigger depending on the current context  
            triggerHandler.MTrigger.isBefore = true;  
      
            if(Trigger.isInsert) {  
      
                triggerHandler.MTrigger.isInsert = true;  
                //triggerHandler.onBeforeInsert();  
      
            }  
      
            if(Trigger.isUpdate) {  
      
                triggerHandler.MTrigger.isUpdate = true;  
                //triggerHandler.onBeforeUpdate();  
      
            }
            
        }

        // Limits.getDMLRows() and Limits.getDMLStatements() tell you how many rows you've touched and how many individual DML statements you've made. 
        // Compare these numbers with the absolute limits returned by Limits.getLimitDMLRows() and Limits.getLimitDMLStatements(), respectively. 

        // Report Governor Limit Stats and set return values
        // Utils.debugLimits(); // apex-lang project
        // System.Debug('## >>> StaffScheduleTrigger END <<<');
    
    }

}