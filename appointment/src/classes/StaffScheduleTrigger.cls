public class StaffScheduleTrigger {
  
    // Attributes  
    public StaffScheduleExtTrigger MTrigger;  
  
    public StaffScheduleTrigger (StaffScheduleExtTrigger MTrigger) {  
        this.MTrigger = MTrigger;  
    }
    
    public void onBeforeInsert() {  
  
        try {  
  
            for (Staff_Schedule__c s : MTrigger.newValues) { // for all records

                // System.Debug('## >>> ' + s);
                
                // if open on Sunday and record inserted
                if (s.Sunday__c) {

                    s.Sunday_From_DT__c = Utils.getConvertDateTime(s.Sunday_From__c); // Datetime returned by getConvertDateTime()
                    s.Sunday_To_DT__c = Utils.getConvertDateTime(s.Sunday_To__c); // Datetime returned by getConvertDateTime()
                    s.Sunday_Duration__c = Utils.CalcTimeDuration(s.Sunday_From__c,s.Sunday_To__c); // Minutes returned CalcTimeDuration()

                }

                // if open on Monday and record inserted
                if (s.Monday__c) {

                    s.Monday_From_DT__c = Utils.getConvertDateTime(s.Monday_From__c); // Datetime returned by getConvertDateTime()
                    s.Monday_To_DT__c = Utils.getConvertDateTime(s.Monday_To__c); // Datetime returned by getConvertDateTime()
                    s.Monday_Duration__c = Utils.CalcTimeDuration(s.Monday_From__c,s.Monday_To__c); // Minutes returned CalcTimeDuration()

                }

                // if open on Tuesday and record inserted
                if (s.Tuesday__c) {

                    s.Tuesday_From_DT__c = Utils.getConvertDateTime(s.Tuesday_From__c); // Datetime returned by getConvertDateTime()
                    s.Tuesday_To_DT__c = Utils.getConvertDateTime(s.Tuesday_To__c); // Datetime returned by getConvertDateTime()
                    s.Tuesday_Duration__c = Utils.CalcTimeDuration(s.Tuesday_From__c,s.Tuesday_To__c); // Minutes returned CalcTimeDuration()

                }

                // if open on Wednesday and record inserted
                if (s.Wednesday__c) {

                    s.Wednesday_From_DT__c = Utils.getConvertDateTime(s.Wednesday_From__c); // Datetime returned by getConvertDateTime()
                    s.Wednesday_To_DT__c = Utils.getConvertDateTime(s.Wednesday_To__c); // Datetime returned by getConvertDateTime()
                    s.Wednesday_Duration__c = Utils.CalcTimeDuration(s.Wednesday_From__c,s.Wednesday_To__c); // Minutes returned CalcTimeDuration()

                }

                // if open on Thursday and record inserted
                if (s.Thursday__c) {

                    s.Thursday_From_DT__c = Utils.getConvertDateTime(s.Thursday_From__c); // Datetime returned by getConvertDateTime()
                    s.Thursday_To_DT__c = Utils.getConvertDateTime(s.Thursday_To__c); // Datetime returned by getConvertDateTime()
                    s.Thursday_Duration__c = Utils.CalcTimeDuration(s.Thursday_From__c,s.Thursday_To__c); // Minutes returned CalcTimeDuration()

                }

                // if open on Friday and record inserted
                if (s.Friday__c) {

                    s.Friday_From_DT__c = Utils.getConvertDateTime(s.Friday_From__c); // Datetime returned by getConvertDateTime()
                    s.Friday_To_DT__c = Utils.getConvertDateTime(s.Friday_To__c); // Datetime returned by getConvertDateTime()
                    s.Friday_Duration__c = Utils.CalcTimeDuration(s.Friday_From__c,s.Friday_To__c); // Minutes returned CalcTimeDuration()

                }

                // if open on Saturday and record inserted
                if (s.Saturday__c) {

                    s.Saturday_From_DT__c = Utils.getConvertDateTime(s.Saturday_From__c); // Datetime returned by getConvertDateTime()
                    s.Saturday_To_DT__c = Utils.getConvertDateTime(s.Saturday_To__c); // Datetime returned by getConvertDateTime()
                    s.Saturday_Duration__c = Utils.CalcTimeDuration(s.Saturday_From__c,s.Saturday_To__c); // Minutes returned CalcTimeDuration()

                }

            }

        } catch(Exception e) { // if error is encountered
            System.Debug('StaffScheduleTrigger Before Insert Exception '+e.getMessage()); // write error to the debug log
            // System.debug('StaffScheduleTrigger Before Insert Exception '+e);  
            // ((Staff_Schedule__c)MTrigger.newValues[0]).addError(sExceptionMessage);  
        }
  
    } // public void onBeforeInsert()  
  
    public void onBeforeUpdate() {  
  
        try {  
  
            for (Staff_Schedule__c s : MTrigger.newValues) { // for all records

                // System.Debug('## >>> ' + s);
                
                // if closed on Sunday
                if (!s.Sunday__c) {               

                    // Did the standard work day flag change?
                    if (s.Sunday__c != MTrigger.oldMap.get(s.Id).Sunday__c) { 

                        s.Sunday_From__c = null;
                        s.Sunday_From_DT__c = null;
                        s.Sunday_To__c = null;
                        s.Sunday_To_DT__c = null;
                        s.Sunday_Duration__c = null;

                    }

                } else { // if open on Sunday
                
                    // if a time changed
                    if ( (s.Sunday_From__c != MTrigger.oldMap.get(s.Id).Sunday_From__c) || (s.Sunday_To__c != MTrigger.oldMap.get(s.Id).Sunday_To__c) ) {
                        
                        s.Sunday_From_DT__c = Utils.getConvertDateTime(s.Sunday_From__c); // Datetime returned by getConvertDateTime()
                        s.Sunday_To_DT__c = Utils.getConvertDateTime(s.Sunday_To__c); // Datetime returned by getConvertDateTime()
                        s.Sunday_Duration__c = Utils.CalcTimeDuration(s.Sunday_From__c,s.Sunday_To__c); // Minutes returned CalcTimeDuration()

                    }

                }

                // if closed on Monday
                if (!s.Monday__c) {               

                    // Did the standard work day flag change?
                    if (s.Monday__c != MTrigger.oldMap.get(s.Id).Monday__c) { 

                        s.Monday_From__c = null;
                        s.Monday_From_DT__c = null;
                        s.Monday_To__c = null;
                        s.Monday_To_DT__c = null;
                        s.Monday_Duration__c = null;

                    }

                } else { // if open on Monday
                
                    // if a time changed
                    if ( (s.Monday_From__c != MTrigger.oldMap.get(s.Id).Monday_From__c) || (s.Monday_To__c != MTrigger.oldMap.get(s.Id).Monday_To__c) ) {
                        
                        s.Monday_From_DT__c = Utils.getConvertDateTime(s.Monday_From__c); // Datetime returned by getConvertDateTime()
                        s.Monday_To_DT__c = Utils.getConvertDateTime(s.Monday_To__c); // Datetime returned by getConvertDateTime()
                        s.Monday_Duration__c = Utils.CalcTimeDuration(s.Monday_From__c,s.Monday_To__c); // Minutes returned CalcTimeDuration()

                    }

                }

                // if closed on Tuesday
                if (!s.Tuesday__c) {               

                    // Did the standard work day flag change?
                    if (s.Tuesday__c != MTrigger.oldMap.get(s.Id).Tuesday__c) { 

                        s.Tuesday_From__c = null;
                        s.Tuesday_From_DT__c = null;
                        s.Tuesday_To__c = null;
                        s.Tuesday_To_DT__c = null;
                        s.Tuesday_Duration__c = null;

                    }

                } else { // if open on Tuesday
                
                    // if a time changed
                    if ( (s.Tuesday_From__c != MTrigger.oldMap.get(s.Id).Tuesday_From__c) || (s.Tuesday_To__c != MTrigger.oldMap.get(s.Id).Tuesday_To__c) ) {
                        
                        s.Tuesday_From_DT__c = Utils.getConvertDateTime(s.Tuesday_From__c); // Datetime returned by getConvertDateTime()
                        s.Tuesday_To_DT__c = Utils.getConvertDateTime(s.Tuesday_To__c); // Datetime returned by getConvertDateTime()
                        s.Tuesday_Duration__c = Utils.CalcTimeDuration(s.Tuesday_From__c,s.Tuesday_To__c); // Minutes returned CalcTimeDuration()

                    }

                }

                // if closed on Wednesday
                if (!s.Wednesday__c) {               

                    // Did the standard work day flag change?
                    if (s.Wednesday__c != MTrigger.oldMap.get(s.Id).Wednesday__c) { 

                        s.Wednesday_From__c = null;
                        s.Wednesday_From_DT__c = null;
                        s.Wednesday_To__c = null;
                        s.Wednesday_To_DT__c = null;
                        s.Wednesday_Duration__c = null;

                    }

                } else { // if open on Wednesday
                
                    // if a time changed
                    if ( (s.Wednesday_From__c != MTrigger.oldMap.get(s.Id).Wednesday_From__c) || (s.Wednesday_To__c != MTrigger.oldMap.get(s.Id).Wednesday_To__c) ) {
                        
                        s.Wednesday_From_DT__c = Utils.getConvertDateTime(s.Wednesday_From__c); // Datetime returned by getConvertDateTime()
                        s.Wednesday_To_DT__c = Utils.getConvertDateTime(s.Wednesday_To__c); // Datetime returned by getConvertDateTime()
                        s.Wednesday_Duration__c = Utils.CalcTimeDuration(s.Wednesday_From__c,s.Wednesday_To__c); // Minutes returned CalcTimeDuration()

                    }

                }

                // if closed on Thursday
                if (!s.Thursday__c) {               

                    // Did the standard work day flag change?
                    if (s.Thursday__c != MTrigger.oldMap.get(s.Id).Thursday__c) { 

                        s.Thursday_From__c = null;
                        s.Thursday_From_DT__c = null;
                        s.Thursday_To__c = null;
                        s.Thursday_To_DT__c = null;
                        s.Thursday_Duration__c = null;

                    }

                } else { // if open on Thursday
                
                    // if a time changed
                    if ( (s.Thursday_From__c != MTrigger.oldMap.get(s.Id).Thursday_From__c) || (s.Thursday_To__c != MTrigger.oldMap.get(s.Id).Thursday_To__c) ) {
                        
                        s.Thursday_From_DT__c = Utils.getConvertDateTime(s.Thursday_From__c); // Datetime returned by getConvertDateTime()
                        s.Thursday_To_DT__c = Utils.getConvertDateTime(s.Thursday_To__c); // Datetime returned by getConvertDateTime()
                        s.Thursday_Duration__c = Utils.CalcTimeDuration(s.Thursday_From__c,s.Thursday_To__c); // Minutes returned CalcTimeDuration()

                    }

                }

                // if closed on Friday
                if (!s.Friday__c) {               

                    // Did the standard work day flag change?
                    if (s.Friday__c != MTrigger.oldMap.get(s.Id).Friday__c) { 

                        s.Friday_From__c = null;
                        s.Friday_From_DT__c = null;
                        s.Friday_To__c = null;
                        s.Friday_To_DT__c = null;
                        s.Friday_Duration__c = null;

                    }

                } else { // if open on Friday
                
                    // if a time changed
                    if ( (s.Friday_From__c != MTrigger.oldMap.get(s.Id).Friday_From__c) || (s.Friday_To__c != MTrigger.oldMap.get(s.Id).Friday_To__c) ) {
                        
                        s.Friday_From_DT__c = Utils.getConvertDateTime(s.Friday_From__c); // Datetime returned by getConvertDateTime()
                        s.Friday_To_DT__c = Utils.getConvertDateTime(s.Friday_To__c); // Datetime returned by getConvertDateTime()
                        s.Friday_Duration__c = Utils.CalcTimeDuration(s.Friday_From__c,s.Friday_To__c); // Minutes returned CalcTimeDuration()

                    }

                }

                // if closed on Saturday
                if (!s.Saturday__c) {               

                    // Did the standard work day flag change?
                    if (s.Saturday__c != MTrigger.oldMap.get(s.Id).Saturday__c) { 

                        s.Saturday_From__c = null;
                        s.Saturday_From_DT__c = null;
                        s.Saturday_To__c = null;
                        s.Saturday_To_DT__c = null;
                        s.Saturday_Duration__c = null;

                    }

                } else { // if open on Saturday
                
                    // if a time changed
                    if ( (s.Saturday_From__c != MTrigger.oldMap.get(s.Id).Saturday_From__c) || (s.Saturday_To__c != MTrigger.oldMap.get(s.Id).Saturday_To__c) ) {
                        
                        s.Saturday_From_DT__c = Utils.getConvertDateTime(s.Saturday_From__c); // Datetime returned by getConvertDateTime()
                        s.Saturday_To_DT__c = Utils.getConvertDateTime(s.Saturday_To__c); // Datetime returned by getConvertDateTime()
                        s.Saturday_Duration__c = Utils.CalcTimeDuration(s.Saturday_From__c,s.Saturday_To__c); // Minutes returned CalcTimeDuration()

                    }

                }

            }

        } catch(Exception e) { // if error is encountered
            System.Debug('StaffScheduleTrigger Before Update Exception '+e.getMessage()); // write error to the debug log
            // System.debug('StaffScheduleTrigger Before Update Exception '+e);  
            // ((Staff_Schedule__c)MTrigger.newValues[0]).addError(sExceptionMessage);  
        }
  
    } // public void onBeforeUpdate()  
  
}