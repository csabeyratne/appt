public class SettingTrigger {  
  
    //Attributes  
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

                // System.Debug('## >>> isBefore? ' + MTrigger.isBefore);
                // System.Debug('## >>> isInsert? ' + MTrigger.isInsert);
                // System.Debug('## >>> Open on Sunday? - ' + s.Sunday__c);
                // System.Debug('## >>> Sunday_From__c ' + s.Sunday_From__c);
                // System.Debug('## >>> Sunday_From_DT__c ' + s.Sunday_From_DT__c);
                // System.Debug('## >>> Sunday_To__c ' + s.Sunday_To__c);
                // System.Debug('## >>> Sunday_To_DT__c ' + s.Sunday_To_DT__c);
                // System.Debug('## >>> Sunday_Duration__c ' + s.Sunday_Duration__c);

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
  
    }  
  
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

                // System.Debug('## >>> isBefore? ' + MTrigger.isBefore);
                // System.Debug('## >>> isUpdate? ' + MTrigger.isUpdate);
                // System.Debug('## >>> Open on Sunday? - ' + s.Sunday__c);
                // System.Debug('## >>> Sunday_From__c ' + s.Sunday_From__c);
                // System.Debug('## >>> Sunday_From_DT__c ' + s.Sunday_From_DT__c);
                // System.Debug('## >>> Sunday_To__c ' + s.Sunday_To__c);
                // System.Debug('## >>> Sunday_To_DT__c ' + s.Sunday_To_DT__c);
                // System.Debug('## >>> Sunday_Duration__c ' + s.Sunday_Duration__c);

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
  
    }  
  
    public void onAfterInsert() {  
  
        try {  
  
            List<Time_Range__c> TimeRangesToCreate = new List<Time_Range__c>(); // build list in memory

            for (Setting__c s : MTrigger.newValues) { // for all records

                // System.Debug('## >>> ' + s);
                
                //Boolean findGM = false;
                //Integer countGM = 0;
                //GroupMember gm;
                //while (!findGM && countGM < groupMemberList.size()) {
                //    if (groupMemberList[countGM].UserOrGroupId == go[0].id && groupMemberList[countGM].GroupId == teamGroup.Id) {
                //        findGM = true;
                //        gm = groupMemberList[countGM];
                //        List<String> groupMembersIds = new List<String>();
                //        groupMembersIds.add(gm.id);
                //        TeamUtil.deleteGroupMembers(groupMembersIds);
                //    }
                //    else {
                //        countGM++;  
                //    }   
                //}

                //for(case_role__c cr: [select id,case_subject__c from case_role__c where case__c = :Trigger.new.id ]){
                //cr.case_subject__c = casenew.subject;
                
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

                // System.Debug('## >>> isAfter? ' + MTrigger.isAfter);
                // System.Debug('## >>> isInsert? ' + MTrigger.isInsert);
                // System.Debug('## >>> Open on Sunday? - ' + s.Sunday__c);
                // System.Debug('## >>> Sunday_From__c ' + s.Sunday_From__c);
                // System.Debug('## >>> Sunday_From_DT__c ' + s.Sunday_From_DT__c);
                // System.Debug('## >>> Sunday_To__c ' + s.Sunday_To__c);
                // System.Debug('## >>> Sunday_To_DT__c ' + s.Sunday_To_DT__c);
                // System.Debug('## >>> Sunday_Duration__c ' + s.Sunday_Duration__c);

                Datetime MondayFromDT = s.Monday_From_DT__c;
                Datetime MondayToDT = s.Monday_To_DT__c;
                
                while (s.Monday__c && MondayFromDT <= MondayToDT) {
                
                    // System.Debug('## >>> MondayFromDT ' + MondayFromDT + ' - ' + MondayToDT);
                    
                    Time_Range__c tr = new Time_Range__c();
                    tr.Settings__c = s.Id;
                    tr.Name = 'Monday Time';
                    tr.Weekday_Number__c = 0;
                    
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
                    tr.Weekday_Number__c = 0;
                    
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
                    tr.Weekday_Number__c = 0;
                    
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
                    tr.Weekday_Number__c = 0;
                    
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
                    tr.Weekday_Number__c = 0;
                    
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
                    tr.Weekday_Number__c = 0;
                    
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

            }

            // bulk insert entire TimeRangesToCreate list
            //if (!TimeRangesToCreate.isEmpty()) {
            //    try {
            //        insert TimeRangesToCreate; // NOTE: this is outside the above loop, only one insert is needed
            //    } catch (System.DmlException e) {
            //        System.Debug('SettingTrigger TimeRange Insert Exception: '+e); //write error to the debug log
            //    }
            //}

            if (TimeRangesToCreate.size() > 0 ) {
            
                System.Debug('## >>> TimeRangesToCreate ' + TimeRangesToCreate);

                // createTimeRanges(TimeRangesToCreate);
                TimeRangesInsertBatch batch = new TimeRangesInsertBatch();
                //batch.TimeRangesToCreate = TimeRangesToCreate;
                Database.executeBatch(batch, 20);

                
            }
  
        } catch(Exception e) { //if error is encountered
            System.Debug('SettingTrigger After Insert Exception '+e.getMessage()); //write error to the debug log
            // System.debug('SettingTrigger After Insert Exception '+e);  
            // ((Setting_c)MTrigger.newValues[0]).addError(sExceptionMessage);  
        }
  
    }  
  
    public void onAfterUpdate() {  
  
        try {  
  
            List<Time_Range__c> TimeRangesToCreate = new List<Time_Range__c>(); // build list in memory
            List<Time_Range__c> TimeRangesToUpdate = new List<Time_Range__c>(); // build list in memory
            List<Time_Range__c> TimeRangesToDelete = new List<Time_Range__c>(); // build list in memory
            //List<Id> idsToQuery = new List<Id>{};

            for (Setting__c s : MTrigger.newValues) { // for all records

                System.Debug('## >>> ' + s);
                System.Debug('## >>> SettingTrigger - newValues ' + MTrigger.newValues);
                System.Debug('## >>> SettingTrigger - oldValues ' + MTrigger.oldValues);
                System.Debug('## >>> SettingTrigger - newMap ' + MTrigger.newMap);
                System.Debug('## >>> SettingTrigger - oldMap ' + MTrigger.oldMap);
                System.Debug('## >>> SettingTrigger - newMap.keySet() ' + MTrigger.newMap.keySet());
                System.Debug('## >>> SettingTrigger - oldMap.keySet() ' + MTrigger.oldMap.keySet());
                System.Debug('## >>> SettingTrigger - MTrigger.newMap.keySet() ' + MTrigger.newMap.keySet());
                System.Debug('## >>> SettingTrigger - MTrigger.oldMap.keySet() ' + MTrigger.oldMap.keySet());
                System.Debug('## >>> SettingTrigger - MTrigger.newMap.get(s.Id) ' + MTrigger.newMap.get(s.Id));
                System.Debug('## >>> SettingTrigger - MTrigger.oldMap.get(s.Id) ' + MTrigger.oldMap.get(s.Id));
                System.Debug('## >>> SettingTrigger - s.Id ' + s.Id);
                
                for(Time_Range__c[] timesToDelete :[Select t.Id from Time_Range__c t where Settings__r.Id IN :MTrigger.newMap.keySet()]) {
                //    delete flights;
                    System.Debug('## >>> PLEASE WORK!!! timesToDelete ' + timesToDelete);
                }
                
                //for(Flight__c[] flights:[Select f.Id,f.Name From Flight__c f where f.Insertion_Order__c in :Trigger.oldMap.keySet()]) {
                //    delete flights;
                //}
                
                //Flight__c[] flights = [Select f.Id,f.Name From Flight__c f where f.Insertion_Order__c in :Trigger.oldMap.keySet() ];
                //delete flights;
                
                    //Set<Id> oppIdSet = new Set<Id> {};
                //for(Opportunity o : opportunities){
                //    oppIdSet.add ( o.Id );
                //}

                //Flight__c[] flights = [Select f.Id,f.Name From Flight__c f where f.Insertion_Order__c in :oppIdSet ];
                //delete flights;
                  
                //List<Id> idsToQuery = new List<Id>{};
                //for(CustomObject__c a: Trigger.new){
                //    idsToQuery.add(a.id);
                //}
                //query all child records where parent ids were deleted
                //ChildObject__c[] objsToDelete = [select id from ChildObject__c where ParentId__c IN :idsToQuery];
                //delete objsToDelete; //perform delete statement
                
                //delete [Select Id From MeetingAttendees__c Where Meeting_Report__c in :meetingIds];
                
                //Lead NewLead = trigger.new[0];
                //Lead OldLead = trigger.old[0];
                //Lead LeadObject = new Lead(); // This takes all available fields from the required object.
                //Schema.SObjectType objType = LeadObject.getSObjectType();
                //Map<String, Schema.SObjectField> M = Schema.SObjectType.Lead.fields.getMap();

                //for (String str : M.keyset()) {
                //    try {
                //        System.debug('Field name: '+str +'. New value: ' + NewLead.get(str) +'. Old value: '+OldLead.get(str));
                //        if(NewLead.get(str) != OldLead.get(str)){
                //            system.debug('******The value has changed!!!! ');
                              // here goes more code
                //        }
                //    } catch (Exception e) {
                //        System.debug('Error: ' + e);
                //    }
                //}

                //Integer i = [select count() from Student_Call_Log__c where Related_Student__c = :sid];
                
                System.Debug('## >>> isAfter? ' + MTrigger.isAfter);
                System.Debug('## >>> isUpdate? ' + MTrigger.isUpdate);
                System.Debug('## >>> Open on Sunday? - ' + s.Sunday__c);
                System.Debug('## >>> Sunday_From__c ' + s.Sunday_From__c);
                System.Debug('## >>> Sunday_From_DT__c ' + s.Sunday_From_DT__c);
                System.Debug('## >>> Sunday_To__c ' + s.Sunday_To__c);
                System.Debug('## >>> Sunday_To_DT__c ' + s.Sunday_To_DT__c);
                System.Debug('## >>> Sunday_Duration__c ' + s.Sunday_Duration__c);

            }
 
            // bulk insert entire TimeRangesToCreate list
            //if (!TimeRangesToCreate.isEmpty()) {
            //    try {
            //        insert TimeRangesToCreate; // NOTE: this is outside the above loop, only one insert is needed
            //    } catch (System.DmlException e) {
            //        System.Debug('SettingTrigger TimeRange Insert Exception: '+e); //write error to the debug log
            //    }
            //}
  
            // bulk update entire TimeRangesToUpdate list
            //if (!TimeRangesToUpdate.isEmpty()) {
            //    try {
            //        insert TimeRangesToUpdate; // NOTE: this is outside the above loop, only one update is needed
            //    } catch (System.DmlException e) {
            //        System.Debug('SettingTrigger TimeRange Update Exception: '+e); //write error to the debug log
            //    }
            //}

            // bulk delete entire TimeRangesToDelete list
            //if (!TimeRangesToDelete.isEmpty()) {
            //    try {
            //        insert TimeRangesToDelete; // NOTE: this is outside the above loop, only one delete is needed
            //    } catch (System.DmlException e) {
            //        System.Debug('SettingTrigger TimeRange Delete Exception: '+e); //write error to the debug log
            //    }
            //}

            if (TimeRangesToCreate.size() > 0 ) {
                createTimeRanges(TimeRangesToCreate);
            }
            if (TimeRangesToUpdate.size() > 0 ) {
                // updateTimeRanges(TimeRangesToUpdate, origRelationships);
                updateTimeRanges(TimeRangesToUpdate);
            }
            if (TimeRangesToDelete.size() > 0 ) {
                deleteTimeRanges(TimeRangesToDelete);
            }

        } catch(Exception e) { //if error is encountered
            System.Debug('SettingTrigger After Update Exception '+e.getMessage()); //write error to the debug log
            // System.debug('SettingTrigger After Update Exception '+e);  
            // ((Setting_c)MTrigger.newValues[0]).addError(sExceptionMessage);  
        }
  
    }  
  
    // Etc....  
    // private void doSomething() {}
    // private void doSomethingElse() {}  

    // @future
    private static void createTimeRanges(Time_Range__c[] TimeRanges) {
    
        // bulk insert entire TimeRangesToCreate list
        //if (!TimeRangesToCreate.isEmpty()) {
            try {
            //insert TimeRangesToCreate; // NOTE: this is outside the above loop, only one insert is needed
            insert TimeRanges; // NOTE: this is outside the above loop, only one insert is needed
            } catch (System.DmlException e) {
                System.Debug('SettingTrigger TimeRange Insert Exception: '+e); //write error to the debug log
            }
        //}
    
    }

    // @future
    private static void updateTimeRanges(Time_Range__c[] TimeRanges) {
    
            // bulk update entire TimeRangesToUpdate list
            //if (!TimeRangesToUpdate.isEmpty()) {
            //    try {
            //        insert TimeRangesToUpdate; // NOTE: this is outside the above loop, only one update is needed
            //    } catch (System.DmlException e) {
            //        System.Debug('SettingTrigger TimeRange Update Exception: '+e); //write error to the debug log
            //    }
            //}
    
    }

    // @future
    private static void deleteTimeRanges(Time_Range__c[] TimeRanges) {
    
            // bulk delete entire TimeRangesToDelete list
            //if (!TimeRangesToDelete.isEmpty()) {
            //    try {
            //        insert TimeRangesToDelete; // NOTE: this is outside the above loop, only one delete is needed
            //    } catch (System.DmlException e) {
            //        System.Debug('SettingTrigger TimeRange Delete Exception: '+e); //write error to the debug log
            //    }
            //}
    
    }
    
}