public class OperatingHoursTrigger {

    // <name> OperatingHoursTrigger </name>
    // <summary> Default Constructor </summary>
    public OperatingHoursTrigger () {}

    // <name> OperatingHoursTrigger </name>
    // <summary> Overloads the OperatingHoursTrigger object constructor to handle OperatingHours processing </summary>
    // <param name="OperatingHours"> OperatingHours objects that are being triggered </param>
    // <param name="oldOperatingHours"> OperatingHours object values before trigger event </param>
    // <param name="ta"> Trigger action that is occurring </param>
    public OperatingHoursTrigger(Operating_Hours__c[] OperatingHours, Operating_Hours__c[] oldOperatingHours, OperatingHoursUtils.triggerAction ta) 
    {
    
        System.Debug('## >>> ta ' + ta);

        // create a container to bulk insert time ranges
        List<Time_Range__c> TimeRangesToCreate = new List<Time_Range__c>();
        //DateTime dT = System.now();
        //Date myDate = date.newinstance(dT.year(), dT.month(), dT.day());
        
        // Check if 'isUpdate'
        //Integer count = [select count() from SiteFnc__c where Term__c = :TermToGenD AND Site_Lease__c = :LeaseID];
        //Select count(E.Name) from Employee_Hours__c E GROUP BY E.Employee__s.Operating_Hours__c
        //Select E.Employee__s.Operating_Hours__c, count(E.Name) from Employee_Hours__c E GROUP BY E.Employee__s.Operating_Hours__c
        // Lookup blogs and see if there is a blog that is already marked as "Default".
        //Id defaultBlogId = null;
        //try { 
            //defaultBlogId = [SELECT Id, Default__c FROM Blog__c WHERE Default__c = true LIMIT 1].Id;
        //} catch (Exception e) {
            // If there aren't defualt blogs, we just keep the null value... Do Nothing.
        //}

        //System.Debug('## >>> OperatingHours ' + r);
            
        // loop through trigger records
        for (Operating_Hours__c s : OperatingHours)
        {

            System.Debug('## >>> OperatingHours ' + s);
            
            
            //AFTER INSERT OR AFTER INSERT
            
            
            //AFTER INSERT
            if ( ta==OperatingHoursUtils.triggerAction.afterInsert )
            {

                // loop 'Default_Pay_Periods__c' times
                //for (Integer i = 1; i <= s.Default_Pay_Periods__c; i++) 
                for (Integer i = 1; i <= 20; i++) 
                {

                    //Time_Range__c tr = new Time_Range__c();
                    //tr.Operating_Hours__c = s.Id;

                    //TimeRangesToCreate.add(tr);

                }

            }

            //AFTER UPDATE
            if ( ta==OperatingHoursUtils.triggerAction.afterUpdate )
            {
            
            
            

            }

        }

        // bulk insert TimeRangesToCreate
        if (!TimeRangesToCreate.isEmpty()) {
                insert TimeRangesToCreate;
        } 

        // bulk update TimeRangesToUpdate
        //if (!TimeRangesToUpdate.isEmpty()) {
        //    try {
        //        update TimeRangesToUpdate;
        //    } catch (Exception e){
        //        for (Integer i : queueIds.keySet())
        //        {
        //            Trigges.new[i].addError('ERROR: Could not update Assignment Group records ' + ' DETAIL: '+e.getMessage());  
        //        }
        //    }
        //}

        // Pay Period list for termination updates
        //List<Operating_Hours__c> timerangesToCreate = new List<Operating_Hours__c>();
        //List<Operating_Hours__c> timerangesToUpdate = new List<Operating_Hours__c>();

        //DateTime dt = System.now();
        //Date nowDate = date.newinstance(dT.year(), dT.month(), dT.day());
        
        //Integer i = 0; // processing counter
        
        //for(Operating_Hours__c r : TimeRanges) 
        //{
            // AFTER INSERT
            //if (ta==OperatingHoursUtils.triggerAction.afterInsert) 
            //{
                //if (tr.Time_Range__c == null)
                //{
                    //timerangesToCreate.add(tr);
                //}
                //if (tr.Time_Range__c != null)
                //{
                    //timerangesToUpdate.add(tr);
                //}
            //}
            
            // AFTER UPDATE
            //if (ta==OperatingHoursUtils.triggerAction.afterUpdate) 
            //{
                //if (tr.Time_Range__c == oldTimeRanges[i].Time_Range__c)
                //{
                    //timerangesToUpdate.add(tr);
                //}
            //}

            //i += 1;
        //}

        //if (timerangesToCreate.size() > 0 ) {
            //createTimeRange(timerangesToCreate);
        //}
        //if (timerangesToUpdate.size() > 0 ) {
            //updateTimeRange(timerangesToUpdate);
        //}

    }

}