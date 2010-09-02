trigger SettingTrigger on Setting__c (before insert, before update, after insert, after update) {  

    if (!Utils.inFutureContext) { // Prevent recursive future method calls
    
        // System.Debug('## >>> SettingTrigger START run by ' + UserInfo.getName());

        // Create the instance of ExtTrigger and call the constructor in our apex class  
        SettingTrigger triggerHandler = new SettingTrigger( new SettingExtTrigger(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap) );  
  
        // System.Debug('## >>> SettingTrigger - isBefore? ' + Trigger.isBefore);
        // System.Debug('## >>> SettingTrigger - isAfter? ' + Trigger.isAfter);
        // System.Debug('## >>> SettingTrigger - isInsert? ' + Trigger.isInsert);
        // System.Debug('## >>> SettingTrigger - isUpdate? ' + Trigger.isUpdate);
        // System.Debug('## >>> SettingTrigger - newValues ' + triggerHandler.MTrigger.newValues);
        // System.Debug('## >>> SettingTrigger - oldValues ' + triggerHandler.MTrigger.oldValues);
        // System.Debug('## >>> SettingTrigger - newMap ' + triggerHandler.MTrigger.newMap);
        // System.Debug('## >>> SettingTrigger - oldMap ' + triggerHandler.MTrigger.oldMap);
  
        if(Trigger.isBefore) {  
  
            //Now we set the attributes for our trigger depending on the current context  
            triggerHandler.MTrigger.isBefore = true;  
      
            if(Trigger.isInsert) {  
      
                triggerHandler.MTrigger.isInsert = true;  
                triggerHandler.onBeforeInsert();  
      
            }  
      
            if(Trigger.isUpdate) {  
      
                triggerHandler.MTrigger.isUpdate = true;  
                triggerHandler.onBeforeUpdate();  
      
            }  

        } else if (Trigger.isAfter) { 
    
            // Now we set the attributes for our trigger depending on the current context  
            triggerHandler.MTrigger.isAfter = true;  
      
            if(Trigger.isInsert) {  
      
                triggerHandler.MTrigger.isInsert = true;  
                triggerHandler.onAfterInsert();  
      
            }  
      
            if(Trigger.isUpdate) {  
      
                triggerHandler.MTrigger.isUpdate = true;  
                triggerHandler.onAfterUpdate();  
      
            }  

        }
     
        // Limits.getDMLRows() and Limits.getDMLStatements() tell you how many rows you've touched and how many individual DML statements you've made. 
        // Compare these numbers with the absolute limits returned by Limits.getLimitDMLRows() and Limits.getLimitDMLStatements(), respectively. 

        // Report Governor Limit Stats and set return values
        // Utils.debugLimits(); // apex-lang project
        // System.Debug('## >>> SettingTrigger END <<<');
    
    }

}