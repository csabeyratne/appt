public class SettingTrigger {
  
    // Attributes  
    public SettingExtTrigger MTrigger;  
  
    public SettingTrigger(SettingExtTrigger MTrigger) {  
        this.MTrigger = MTrigger;  
    }  
  
    public void onBeforeInsert() {  
  
        try {  
  
            for (Setting__c s : MTrigger.newValues) { // for all records

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

        } catch(Exception e) { //if error is encountered
            System.Debug('SettingTrigger Before Insert Exception '+e.getMessage()); //write error to the debug log
            // System.debug('SettingTrigger Before Insert Exception '+e);  
            // ((Setting_c)MTrigger.newValues[0]).addError(sExceptionMessage);  
        }
  
    } // public void onBeforeInsert()  
  
    public void onBeforeUpdate() {  
  
        try {  
  
            for (Setting__c s : MTrigger.newValues) { // for all records

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

        } catch(Exception e) { //if error is encountered
            System.Debug('SettingTrigger Before Update Exception '+e.getMessage()); //write error to the debug log
            // System.debug('SettingTrigger Before Update Exception '+e);  
            // ((Setting_c)MTrigger.newValues[0]).addError(sExceptionMessage);  
        }
  
    } // public void onBeforeUpdate()  
  
    public void onAfterInsert() {  
  
        try {  
  
            createTimeRanges(MTrigger.newMap.keySet()); // @future insert times for business operating hours 

            // bulk insert entire TimeRangesToCreate list
            //if (!TimeRangesToCreate.isEmpty()) {
            //    try {
            //        insert TimeRangesToCreate; // NOTE: this is outside the above loop, only one insert is needed
            //    } catch (System.DmlException e) {
            //        System.Debug('SettingTrigger TimeRange Insert Exception: '+e); //write error to the debug log
            //    }
            //}

        } catch(Exception e) { //if error is encountered
            System.Debug('SettingTrigger After Insert Exception '+e.getMessage()); //write error to the debug log
            // System.debug('SettingTrigger After Insert Exception '+e);  
            // ((Setting_c)MTrigger.newValues[0]).addError(sExceptionMessage);  
        }
  
    } // public void onAfterInsert()  
  
    public void onAfterUpdate() {  
  
        try {  
  
            // System.Debug('## >>> SettingTrigger - newValues ' + MTrigger.newValues);
            // System.Debug('## >>> SettingTrigger - oldValues ' + MTrigger.oldValues);
            // System.Debug('## >>> SettingTrigger - newMap ' + MTrigger.newMap);
            // System.Debug('## >>> SettingTrigger - oldMap ' + MTrigger.oldMap);
            // System.Debug('## >>> SettingTrigger - MTrigger.newMap.keySet() ' + MTrigger.newMap.keySet());
            // System.Debug('## >>> SettingTrigger - MTrigger.oldMap.keySet() ' + MTrigger.oldMap.keySet());
            
            for (Setting__c s : MTrigger.newValues) { // for all records

                // System.Debug('## >>> ' + s);
                // System.Debug('## >>> Monday ' + s.Id + ', ' + s.Monday__c + ', ' + s.Monday_From__c + ', ' + s.Monday_From_DT__c + ', ' + s.Monday_To__c + ', ' + s.Monday_To_DT__c + ', ' + s.Monday_Duration__c + ', ' + s.Monday_Times_Count__c);
                
                // Access all the information we need in a single query   
                // rather than querying when we need it.  
                // This is a best practice for bulkifying requests  
                set<Id> idsToDelete = new set<Id>();
            
                // First load the times into memory 
                Time_Range__c[] times = [Select t.Id, t.Weekday__c from Time_Range__c t where Settings__r.Id = :s.Id];
                 
                // System.Debug('## >>> times ' + times);

                // Now find the distinct Time Range Ids 
                for (Time_Range__c tr : times) { 
                
                    // System.Debug('## >>> tr ' + tr);
                
                    // System.assert(tr.Id != null);
                    // System.assert(tr.Weekday__c != null);

                    // System.Debug('## >>> s.Monday__c ' + s.Monday__c);
                    // System.Debug('## >>> MTrigger.oldMap.get(s.Id).Monday__c ' + MTrigger.oldMap.get(s.Id).Monday__c);
                    // System.Debug('## >>> s.Monday_From__c ' + s.Monday_From__c);
                    // System.Debug('## >>> MTrigger.oldMap.get(s.Id).Monday_From__c ' + MTrigger.oldMap.get(s.Id).Monday_From__c);
                    // System.Debug('## >>> s.Monday_To__c ' + s.Monday_To__c);
                    // System.Debug('## >>> MTrigger.oldMap.get(s.Id).Monday_To__c ' + MTrigger.oldMap.get(s.Id).Monday_To__c);
                    // System.Debug('## >>> tr.Weekday__c ' + tr.Weekday__c);

                    if ( (!s.Sunday__c) && (s.Sunday__c != MTrigger.oldMap.get(s.Id).Sunday__c) ||
                        (s.Sunday__c) && ( (s.Sunday_From__c != MTrigger.oldMap.get(s.Id).Sunday_From__c) || (s.Sunday_To__c != MTrigger.oldMap.get(s.Id).Sunday_To__c) ) &&
                        (tr.Weekday__c == 'Sunday') ) {
                        idsToDelete.add(tr.Id); // @future delete times for business operating hours
                    }

                    if ( (!s.Monday__c) && (s.Monday__c != MTrigger.oldMap.get(s.Id).Monday__c) ||
                        (s.Monday__c) && ( (s.Monday_From__c != MTrigger.oldMap.get(s.Id).Monday_From__c) || (s.Monday_To__c != MTrigger.oldMap.get(s.Id).Monday_To__c) ) && 
                        (tr.Weekday__c == 'Monday') ) {
                        idsToDelete.add(tr.Id); // @future delete times for business operating hours
                    }

                    if ( (!s.Tuesday__c) && (s.Tuesday__c != MTrigger.oldMap.get(s.Id).Tuesday__c) ||
                        (s.Tuesday__c) && ( (s.Tuesday_From__c != MTrigger.oldMap.get(s.Id).Tuesday_From__c) || (s.Tuesday_To__c != MTrigger.oldMap.get(s.Id).Tuesday_To__c) ) &&
                        (tr.Weekday__c == 'Tuesday') ) {
                        idsToDelete.add(tr.Id); // @future delete times for business operating hours
                    }

                    if ( (!s.Wednesday__c) && (s.Wednesday__c != MTrigger.oldMap.get(s.Id).Wednesday__c) ||
                        (s.Wednesday__c) && ( (s.Wednesday_From__c != MTrigger.oldMap.get(s.Id).Wednesday_From__c) || (s.Wednesday_To__c != MTrigger.oldMap.get(s.Id).Wednesday_To__c) ) &&
                        (tr.Weekday__c == 'Wednesday') ) {
                        idsToDelete.add(tr.Id); // @future delete times for business operating hours
                    }

                    if ( (!s.Thursday__c) && (s.Thursday__c != MTrigger.oldMap.get(s.Id).Thursday__c) ||
                        (s.Thursday__c) && ( (s.Thursday_From__c != MTrigger.oldMap.get(s.Id).Thursday_From__c) || (s.Thursday_To__c != MTrigger.oldMap.get(s.Id).Thursday_To__c) ) &&
                        (tr.Weekday__c == 'Thursday') ) {
                        idsToDelete.add(tr.Id); // @future delete times for business operating hours
                    }

                    if ( (!s.Friday__c) && (s.Friday__c != MTrigger.oldMap.get(s.Id).Friday__c) ||
                        (s.Friday__c) && ( (s.Friday_From__c != MTrigger.oldMap.get(s.Id).Friday_From__c) || (s.Friday_To__c != MTrigger.oldMap.get(s.Id).Friday_To__c) ) &&
                        (tr.Weekday__c == 'Friday') ) {
                        idsToDelete.add(tr.Id); // @future delete times for business operating hours
                    }

                    if ( (!s.Saturday__c) && (s.Saturday__c != MTrigger.oldMap.get(s.Id).Saturday__c) ||
                        (s.Saturday__c) && ( (s.Saturday_From__c != MTrigger.oldMap.get(s.Id).Saturday_From__c) || (s.Saturday_To__c != MTrigger.oldMap.get(s.Id).Saturday_To__c) ) && 
                        (tr.Weekday__c == 'Saturday') ) {
                        idsToDelete.add(tr.Id); // @future delete times for business operating hours
                    }

                }
                
                // System.Debug('## >>> idsToDelete ' + idsToDelete);
                
                if (idsToDelete.size() > 0 ) {
                    deleteTimeRanges(idsToDelete); // @future delete times for business operating hours
                    createTimeRanges(MTrigger.newMap.keySet()); // @future upsert times for business operating hours 
                }

                //for (Time_Range__c[] TimeRangesToDelete :[Select t.Id from Time_Range__c t where Settings__r.Id = :s.Id]) {
                    //System.Debug('## >>> TimeRangesToDelete.size() ' + TimeRangesToDelete.size());
                    //System.Debug('## >>> TimeRangesToDelete ' + TimeRangesToDelete);
                //}

                //List<Id> idsToQuery = new List<Id>{};
                //for(CustomObject__c a: Trigger.new){
                //    idsToQuery.add(a.id);
                //}
                //query all child records where parent ids were deleted
                //ChildObject__c[] objsToDelete = [select id from ChildObject__c where ParentId__c IN :idsToQuery];
                //delete objsToDelete; //perform delete statement
                
            }
 
        } catch(Exception e) { //if error is encountered
            System.Debug('SettingTrigger After Update Exception '+e.getMessage()); //write error to the debug log
            // System.debug('SettingTrigger After Update Exception '+e);  
            // ((Setting_c)MTrigger.newValues[0]).addError(sExceptionMessage);  
        }
  
    } // public void onAfterUpdate()  
  
    @future 
    public static void createTimeRanges(Set<Id> settingIds) {
    
        List<Time_Range__c> TimeRangesToCreate = new List<Time_Range__c>();

        Setting__c[] settings = [select Id, 
            Sunday__c, Sunday_From_DT__c, Sunday_To_DT__c,
            Monday__c, Monday_From_DT__c, Monday_To_DT__c,
            Tuesday__c, Tuesday_From_DT__c, Tuesday_To_DT__c,
            Wednesday__c, Wednesday_From_DT__c, Wednesday_To_DT__c,
            Thursday__c, Thursday_From_DT__c, Thursday_To_DT__c,
            Friday__c, Friday_From_DT__c, Friday_To_DT__c,
            Saturday__c, Saturday_From_DT__c, Saturday_To_DT__c,
            Interval_Minutes__c
            from Setting__c where Id IN :settingIds];
        
        // System.Debug('## >>> settings ' + settings);
        
        for (Setting__c s : settings) { // for all records

            // System.Debug('## >>> ' + s);
            
            //date target_date;
            //target_date = Date.today();
            //[SELECT c.Id, c.Name,c.Card_Expires_date__c FROM Contact c WHERE Card_Expires_date__c < :target_date ORDER BY c.Name ASC]

            //List<Pricing__c> pList = [select id, start_time__c, end_time__c from pricing__c where pricing__c.start_time__c > :at.slot_start_date_time__c and pricing__c.start_time__c < :at.slot_end_date_time__c];

            //Opportunity[] opps = [select Id from Opportunity where Expiry_Date__c < :Date.valueOf('2010-01-01')];
            //System.Debug(opps.size());

            // Now use 'Interval_Minutes__c' formula field
            // split string on whitespace or colon
            // string splitString = '[\\s:]';
            // String[] intervalDivided = s.Appointment_Intervals__c.split(splitString);
            // integer intervalInteger = Integer.valueOf(intervalDivided .get(0));
            // SundayFromDT = SundayFromDT.addminutes(intervalInteger);

            // System.Debug('## >>> s.Appointment_Intervals__c - ' + s.Appointment_Intervals__c);
            // System.Debug('## >>> s.Interval_Minutes__c - ' + s.Interval_Minutes__c);

            Datetime SundayFromDT = s.Sunday_From_DT__c;
            Datetime SundayToDT = s.Sunday_To_DT__c;
            
            while (s.Sunday__c && SundayFromDT <= SundayToDT) {
            
                // System.Debug('## >>> SundayFromDT ' + SundayFromDT + ' - ' + SundayToDT);
                    
                Time_Range__c tr = new Time_Range__c();
                tr.Settings__c = s.Id;
                tr.Name = 'Sunday Time';
                tr.Weekday_Number__c = 0;
                
                if (SundayFromDT == SundayToDT) {
                    tr.DateTime_Value__c = SundayToDT;
                    tr.Time_String__c = SundayToDT.format('hh:mm a');
                } else {
                    tr.DateTime_Value__c = SundayFromDT;
                    tr.Time_String__c = SundayFromDT.format('hh:mm a');
                }

                TimeRangesToCreate.add(tr); // add to list

                // Add minutes to DateTime
                SundayFromDT = SundayFromDT.addminutes(s.Interval_Minutes__c.intValue());

            }

            Datetime MondayFromDT = s.Monday_From_DT__c;
            Datetime MondayToDT = s.Monday_To_DT__c;
                
            while (s.Monday__c && MondayFromDT <= MondayToDT) {
                
                // System.Debug('## >>> MondayFromDT ' + MondayFromDT + ' - ' + MondayToDT);
                
                Time_Range__c tr = new Time_Range__c();
                tr.Settings__c = s.Id;
                tr.Name = 'Monday Time';
                tr.Weekday_Number__c = 1;
                
                if (MondayFromDT == MondayToDT) {
                    tr.DateTime_Value__c = MondayToDT;
                    tr.Time_String__c = MondayToDT.format('hh:mm a');
                } else {
                    tr.DateTime_Value__c = MondayFromDT;
                    tr.Time_String__c = MondayFromDT.format('hh:mm a');
                }

                TimeRangesToCreate.add(tr); // add to list

                // Add minutes to DateTime
                MondayFromDT = MondayFromDT.addminutes(s.Interval_Minutes__c.intValue());

            }

            Datetime TuesdayFromDT = s.Tuesday_From_DT__c;
            Datetime TuesdayToDT = s.Tuesday_To_DT__c;
                
            while (s.Tuesday__c && TuesdayFromDT <= TuesdayToDT) {
                
                // System.Debug('## >>> TuesdayFromDT ' + TuesdayFromDT + ' - ' + TuesdayToDT);
                
                Time_Range__c tr = new Time_Range__c();
                tr.Settings__c = s.Id;
                tr.Name = 'Tuesday Time';
                tr.Weekday_Number__c = 2;
                
                if (TuesdayFromDT == TuesdayToDT) {
                    tr.DateTime_Value__c = TuesdayToDT;
                    tr.Time_String__c = TuesdayToDT.format('hh:mm a');
                } else {
                    tr.DateTime_Value__c = TuesdayFromDT;
                    tr.Time_String__c = TuesdayFromDT.format('hh:mm a');
                }

                TimeRangesToCreate.add(tr); // add to list

                // Add minutes to DateTime
                TuesdayFromDT = TuesdayFromDT.addminutes(s.Interval_Minutes__c.intValue());

            }

            Datetime WednesdayFromDT = s.Wednesday_From_DT__c;
            Datetime WednesdayToDT = s.Wednesday_To_DT__c;
                
            while (s.Wednesday__c && WednesdayFromDT <= WednesdayToDT) {
                
                // System.Debug('## >>> WednesdayFromDT ' + WednesdayFromDT + ' - ' + WednesdayToDT);
                    
                Time_Range__c tr = new Time_Range__c();
                tr.Settings__c = s.Id;
                tr.Name = 'Wednesday Time';
                tr.Weekday_Number__c = 3;
                    
                if (WednesdayFromDT == WednesdayToDT) {
                    tr.DateTime_Value__c = WednesdayToDT;
                    tr.Time_String__c = WednesdayToDT.format('hh:mm a');
                } else {
                    tr.DateTime_Value__c = WednesdayFromDT;
                    tr.Time_String__c = WednesdayFromDT.format('hh:mm a');
                }

                TimeRangesToCreate.add(tr); // add to list

                // Add minutes to DateTime
                WednesdayFromDT = WednesdayFromDT.addminutes(s.Interval_Minutes__c.intValue());

            }

            Datetime ThursdayFromDT = s.Thursday_From_DT__c;
            Datetime ThursdayToDT = s.Thursday_To_DT__c;
                
            while (s.Thursday__c && ThursdayFromDT <= ThursdayToDT) {
                
                // System.Debug('## >>> ThursdayFromDT ' + ThursdayFromDT + ' - ' + ThursdayToDT);
                    
                Time_Range__c tr = new Time_Range__c();
                tr.Settings__c = s.Id;
                tr.Name = 'Thursday Time';
                tr.Weekday_Number__c = 4;
                    
                if (ThursdayFromDT == ThursdayToDT) {
                    tr.DateTime_Value__c = ThursdayToDT;
                    tr.Time_String__c = ThursdayToDT.format('hh:mm a');
                } else {
                    tr.DateTime_Value__c = ThursdayFromDT;
                    tr.Time_String__c = ThursdayFromDT.format('hh:mm a');
                }

                TimeRangesToCreate.add(tr); // add to list

                // Add minutes to DateTime
                ThursdayFromDT = ThursdayFromDT.addminutes(s.Interval_Minutes__c.intValue());

            }

            Datetime FridayFromDT = s.Friday_From_DT__c;
            Datetime FridayToDT = s.Friday_To_DT__c;
                
            while (s.Friday__c && FridayFromDT <= FridayToDT) {
                
                // System.Debug('## >>> FridayFromDT ' + FridayFromDT + ' - ' + FridayToDT);
                    
                Time_Range__c tr = new Time_Range__c();
                tr.Settings__c = s.Id;
                tr.Name = 'Friday Time';
                tr.Weekday_Number__c = 5;
                    
                if (FridayFromDT == FridayToDT) {
                    tr.DateTime_Value__c = FridayToDT;
                    tr.Time_String__c = FridayToDT.format('hh:mm a');
                } else {
                    tr.DateTime_Value__c = FridayFromDT;
                    tr.Time_String__c = FridayFromDT.format('hh:mm a');
                }

                TimeRangesToCreate.add(tr); // add to list

                // Add minutes to DateTime
                FridayFromDT = FridayFromDT.addminutes(s.Interval_Minutes__c.intValue());

            }

            Datetime SaturdayFromDT = s.Saturday_From_DT__c;
            Datetime SaturdayToDT = s.Saturday_To_DT__c;
                
            while (s.Saturday__c && SaturdayFromDT <= SaturdayToDT) {
                
                // System.Debug('## >>> SaturdayFromDT ' + SaturdayFromDT + ' - ' + SaturdayToDT);
                    
                Time_Range__c tr = new Time_Range__c();
                tr.Settings__c = s.Id;
                tr.Name = 'Saturday Time';
                tr.Weekday_Number__c = 6;
                    
                if (SaturdayFromDT == SaturdayToDT) {
                    tr.DateTime_Value__c = SaturdayToDT;
                    tr.Time_String__c = SaturdayToDT.format('hh:mm a');
                } else {
                    tr.DateTime_Value__c = SaturdayFromDT;
                    tr.Time_String__c = SaturdayFromDT.format('hh:mm a');
                }

                TimeRangesToCreate.add(tr); // add to list

                // Add minutes to DateTime
                SaturdayFromDT = SaturdayFromDT.addminutes(s.Interval_Minutes__c.intValue());

            }

        } // for (Setting__c s : settings) {}

        // bulk insert entire TimeRangesToCreate list
        if (!TimeRangesToCreate.isEmpty()) {
            try {
                Utils.inFutureContext = true; // Prevent the trigger from calling the future method again
                upsert TimeRangesToCreate; // NOTE: this is outside the above loop, only one upsert is needed
            } catch (System.DmlException e) {
                System.Debug('SettingTrigger TimeRange Insert Exception: '+e); //write error to the debug log
            }
        }
        
    }
    
    @future 
    public static void deleteTimeRanges(Set<Id> settingIds) {
    
        // System.Debug('## >>> SettingTrigger - settingIds ' + settingIds);

        for(Time_Range__c[] timesToDelete :[Select Id from Time_Range__c where Id IN :settingIds]) {
            try {
                Utils.inFutureContext = true; // Prevent the trigger from calling the future method again
                delete timesToDelete; // NOTE: this is outside the above loop, only one delete is needed
            } catch (System.DmlException e) {
                System.Debug('SettingTrigger TimeRange Delete Exception: '+e); //write error to the debug log
            }
        }
                
    }
    
}