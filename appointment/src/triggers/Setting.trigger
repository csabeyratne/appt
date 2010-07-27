trigger Setting on Setting__c (before insert, before update, after insert, after update) {

    System.Debug('## >>> Trigger START run by ' + UserInfo.getName());
    System.Debug('## >>> Trigger.isInsert ' + Trigger.isInsert);
    System.Debug('## >>> Trigger.isUpdate ' + Trigger.isUpdate);
    System.Debug('## >>> Trigger.isBefore ' + Trigger.isBefore);
    System.Debug('## >>> Trigger.isAfter ' + Trigger.isAfter);
    
    if (Trigger.isBefore) {

        try {

            for (Setting__c s : Trigger.new) { // for all records

                // System.Debug('## >>> Settings ' + s);
                
                // if Sunday updated to be closed
                if ( (!s.Sunday__c) && (s.Sunday__c != Trigger.oldMap.get(s.Id).Sunday__c) ) {

                    s.Sunday_From__c = null;
                    s.Sunday_From_DT__c = null;
                    s.Sunday_To__c = null;
                    s.Sunday_To_DT__c = null;
                    s.Sunday_Duration__c = null;

                // if open on Sunday and record inserted or a time changed
                } else if ( (Trigger.isInsert) || ( (s.Sunday_From__c != Trigger.oldMap.get(s.Id).Sunday_From__c) || (s.Sunday_To__c != Trigger.oldMap.get(s.Id).Sunday_To__c) ) ) {

                    s.Sunday_From_DT__c = Utils.getConvertDateTime(s.Sunday_From__c);
                    s.Sunday_To_DT__c = Utils.getConvertDateTime(s.Sunday_To__c);
                    s.Sunday_Duration__c = Utils.CalcTimeDuration(s.Sunday_From__c,s.Sunday_To__c);

                    //System.Debug('## >>> Open on Sunday? - ' + s.Sunday__c);
                    //System.Debug('## >>> Sunday_From__c ' + s.Sunday_From__c);
                    //System.Debug('## >>> Sunday_From_DT__c ' + s.Sunday_From_DT__c);
                    //System.Debug('## >>> Sunday_To__c ' + s.Sunday_To__c);
                    //System.Debug('## >>> Sunday_To_DT__c ' + s.Sunday_To_DT__c);
                    //System.Debug('## >>> Sunday_Duration__c ' + s.Sunday_Duration__c);

                }

                // if Monday updated to be closed
                if ( (!s.Monday__c) && (s.Monday__c != Trigger.oldMap.get(s.Id).Monday__c) ) {

                    s.Monday_From__c = null;
                    s.Monday_From_DT__c = null;
                    s.Monday_To__c = null;
                    s.Monday_To_DT__c = null;
                    s.Monday_Duration__c = null;

                // if open on Monday and record inserted or a time changed
                } else if ( (Trigger.isInsert) || ( (s.Monday_From__c != Trigger.oldMap.get(s.Id).Monday_From__c) || (s.Monday_To__c != Trigger.oldMap.get(s.Id).Monday_To__c) ) ) {

                    s.Monday_From_DT__c = Utils.getConvertDateTime(s.Monday_From__c);
                    s.Monday_To_DT__c = Utils.getConvertDateTime(s.Monday_To__c);
                    s.Monday_Duration__c = Utils.CalcTimeDuration(s.Monday_From__c,s.Monday_To__c);

                }

                // if Tuesday updated to be closed
                if ( (!s.Tuesday__c) && (s.Tuesday__c != Trigger.oldMap.get(s.Id).Tuesday__c) ) {

                    s.Tuesday_From__c = null;
                    s.Tuesday_From_DT__c = null;
                    s.Tuesday_To__c = null;
                    s.Tuesday_To_DT__c = null;
                    s.Tuesday_Duration__c = null;

                // if open on Tuesday and record inserted or a time changed
                } else if ( (Trigger.isInsert) || ( (s.Tuesday_From__c != Trigger.oldMap.get(s.Id).Tuesday_From__c) || (s.Tuesday_To__c != Trigger.oldMap.get(s.Id).Tuesday_To__c) ) ) {

                    s.Tuesday_From_DT__c = Utils.getConvertDateTime(s.Tuesday_From__c);
                    s.Tuesday_To_DT__c = Utils.getConvertDateTime(s.Tuesday_To__c);
                    s.Tuesday_Duration__c = Utils.CalcTimeDuration(s.Tuesday_From__c,s.Tuesday_To__c);

                }

                // if Wednesday updated to be closed
                if ( (!s.Wednesday__c) && (s.Wednesday__c != Trigger.oldMap.get(s.Id).Wednesday__c) ) {

                    s.Wednesday_From__c = null;
                    s.Wednesday_From_DT__c = null;
                    s.Wednesday_To__c = null;
                    s.Wednesday_To_DT__c = null;
                    s.Wednesday_Duration__c = null;

                // if open on Wednesday and record inserted or a time changed
                } else if ( (Trigger.isInsert) || ( (s.Wednesday_From__c != Trigger.oldMap.get(s.Id).Wednesday_From__c) || (s.Wednesday_To__c != Trigger.oldMap.get(s.Id).Wednesday_To__c) ) ) {

                    s.Wednesday_From_DT__c = Utils.getConvertDateTime(s.Wednesday_From__c);
                    s.Wednesday_To_DT__c = Utils.getConvertDateTime(s.Wednesday_To__c);
                    s.Wednesday_Duration__c = Utils.CalcTimeDuration(s.Wednesday_From__c,s.Wednesday_To__c);

                }

                // if Thursday updated to be closed
                if ( (!s.Thursday__c) && (s.Thursday__c != Trigger.oldMap.get(s.Id).Thursday__c) ) {

                    s.Thursday_From__c = null;
                    s.Thursday_From_DT__c = null;
                    s.Thursday_To__c = null;
                    s.Thursday_To_DT__c = null;
                    s.Thursday_Duration__c = null;

                // if open on Thursday and record inserted or a time changed
                } else if ( (Trigger.isInsert) || ( (s.Thursday_From__c != Trigger.oldMap.get(s.Id).Thursday_From__c) || (s.Thursday_To__c != Trigger.oldMap.get(s.Id).Thursday_To__c) ) ) {

                    s.Thursday_From_DT__c = Utils.getConvertDateTime(s.Thursday_From__c);
                    s.Thursday_To_DT__c = Utils.getConvertDateTime(s.Thursday_To__c);
                    s.Thursday_Duration__c = Utils.CalcTimeDuration(s.Thursday_From__c,s.Thursday_To__c);

                }

                // if Friday updated to be closed
                if ( (!s.Friday__c) && (s.Friday__c != Trigger.oldMap.get(s.Id).Friday__c) ) {

                    s.Friday_From__c = null;
                    s.Friday_From_DT__c = null;
                    s.Friday_To__c = null;
                    s.Friday_To_DT__c = null;
                    s.Friday_Duration__c = null;

                // if open on Friday and record inserted or a time changed
                } else if ( (Trigger.isInsert) || ( (s.Friday_From__c != Trigger.oldMap.get(s.Id).Friday_From__c) || (s.Friday_To__c != Trigger.oldMap.get(s.Id).Friday_To__c) ) ) {

                    s.Friday_From_DT__c = Utils.getConvertDateTime(s.Friday_From__c);
                    s.Friday_To_DT__c = Utils.getConvertDateTime(s.Friday_To__c);
                    s.Friday_Duration__c = Utils.CalcTimeDuration(s.Friday_From__c,s.Friday_To__c);

                }

                // if Saturday updated to be closed
                if ( (!s.Saturday__c) && (s.Saturday__c != Trigger.oldMap.get(s.Id).Saturday__c) ) {

                    s.Saturday_From__c = null;
                    s.Saturday_From_DT__c = null;
                    s.Saturday_To__c = null;
                    s.Saturday_To_DT__c = null;
                    s.Saturday_Duration__c = null;

                // if open on Saturday and record inserted or a time changed
                } else if ( (Trigger.isInsert) || ( (s.Saturday_From__c != Trigger.oldMap.get(s.Id).Saturday_From__c) || (s.Saturday_To__c != Trigger.oldMap.get(s.Id).Saturday_To__c) ) ) {

                    s.Saturday_From_DT__c = Utils.getConvertDateTime(s.Saturday_From__c);
                    s.Saturday_To_DT__c = Utils.getConvertDateTime(s.Saturday_To__c);
                    s.Saturday_Duration__c = Utils.CalcTimeDuration(s.Saturday_From__c,s.Saturday_To__c);

                }

            }

        } catch(Exception e) { //if error is encountered
            System.Debug('Setting Trigger failed: '+e.getMessage()); //write error to the debug log
        }

    } else if (Trigger.isAfter) { 
    
        // after Settings are inserted
        List<Time_Range__c> TimeRangesToCreate = new List<Time_Range__c>(); // build list in memory

        try {

            for (Setting__c s : Trigger.new) { // for all records

                // System.Debug('## >>> Settings ' + s);
                
                if (Trigger.isUpdate) {
                
                    List<Time_Range__c> timesToDelete = [select id from Time_Range__c where id in :Trigger.newMap.keySet()];

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
                
                    //List<String> timeIds = new List<String>();
                    //for (Time_Range__c tr : trigger.new) {
                    //    timeIds.add(tr.Id);
                    //}
                    //delete [Select Id From MeetingAttendees__c Where Meeting_Report__c in :meetingIds];
                    
                }
                
                //if(Trigger.isUpdate || Trigger.isInsert) {
                //if (Trigger.isInsert) { 

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

                // split string on whitespace or colon
                string splitString = '[\\s:]';
                String[] intervalDivided = s.Appointment_Intervals__c.split(splitString);
                integer intervalInteger = Integer.valueOf(intervalDivided .get(0));

                System.Debug('## >>> s.Appointment_Intervals__c - ' + s.Appointment_Intervals__c);
                System.Debug('## >>> intervalInteger - ' + intervalInteger);

                //for(case_role__c cr: [select id,case_subject__c from case_role__c where case__c = :Trigger.new.id ]){
                //cr.case_subject__c = casenew.subject;
                
                //date target_date;
                //target_date = Date.today();
                //[SELECT c.Id, c.Name,c.Card_Expires_date__c FROM Contact c WHERE Card_Expires_date__c < :target_date ORDER BY c.Name ASC]

                //List<Pricing__c> pList = [select id, start_time__c, end_time__c from pricing__c where pricing__c.start_time__c > :at.slot_start_date_time__c and pricing__c.start_time__c < :at.slot_end_date_time__c];

                Datetime dtFrom = s.Sunday_From_DT__c;
                Datetime dtTo = s.Sunday_To_DT__c;

                System.Debug('## >>> dtFrom ' + dtFrom);
                System.Debug('## >>> dtTo ' + dtTo);
    
                // loop through all 7 days
                for (Integer i = 0; i <= 6; i++) 
                {
                
                    // Add minutes to DateTime
                    dtFrom = dtFrom.addminutes(intervalInteger);

                    System.Debug('## >>> dtFrom ' + dtFrom);
                    System.Debug('## >>> dtTo ' + dtTo);


                //    Time_Range__c tr = new Time_Range__c();
                //    tr.Setting__c = s.Id;
                //    tr.Weekday_Number__c = i
                //    tr.DateTime_Value__c
                //    tr.Time_String__c
                //    tr.Name // Time_Range_Name__c
                
                //    if (s.Appointment_Intervals__c == '15 Minutes') {
                //        tr.Pay_Period_End__c = s.Effective_Date__c - 1 + (7 * i);
                //        tr.Work_Week_End__c = s.Effective_Date__c - 1 + (7 * i);
                //    }
                //    else if(s.Appointment_Intervals__c == '30 Minutes'){
                //        tr.Pay_Period_End__c = s.Effective_Date__c - 1 + (14 * i);
                //        tr.Work_Week_End__c = tr.Pay_Period_End__c - 7;
                //    }
            
                //Task task = new Task(
                //WhoId = lead.Id, 
                //Description = 'Call this lead.', 
                //Priority = 'High', 
                //ReminderDateTime = System.now().addDays(2), 
                //Status = 'Not Started', 
                //Subject = 'New Lead');
            
                //TimeRangessToCreate.add(s); // add to list
                
                }

                //} else if (Trigger.isUpdate) {


                //}

            }

        } catch(Exception e) { //if error is encountered
            System.Debug('Setting Trigger failed: '+e.getMessage()); //write error to the debug log
        }

        // bulk insert entire TimeRangessToCreate list
        if (!TimeRangesToCreate.isEmpty()) {
            insert TimeRangesToCreate; // NOTE: this is outside the above loop, only one insert is needed
        } 

        // update and insert
        
        // system.debug ('to update: ' + CMsToUpdate);
        // system.debug ('to insert: ' + CMsToInsert);
        
        //if ( CMsToUpdate.size() > 0 ) {
        //    try {
        //        update CMsToUpdate;     
        //    } catch (System.DmlException e) {
        //        system.debug ('error: ' + e );  
        //    }
        //}
        
        //insert CMsToInsert;
                
    } // end of isAfter
    
    // Limits.getDMLRows() and Limits.getDMLStatements() tell you how many rows you've touched and how many individual DML statements you've made. 
    // Compare these numbers with the absolute limits returned by Limits.getLimitDMLRows() and Limits.getLimitDMLStatements(), respectively. 

    // Report Governor Limit Stats and set return values
    Utils.debugLimits(); // apex-lang project
    System.Debug('## >>> Trigger END <<<');

}