public class SettingTrigger {

    // <name> SettingTrigger </name>
    // <summary> Default Constructor </summary>
    public SettingTrigger () {}

    // <name> SettingTrigger </name>
    // <summary> Overloads the SettingTrigger object constructor to handle Setting processing </summary>
    // <param name="Settings"> Setting objects that are being triggered </param>
    // <param name="oldSettings"> Setting object values before trigger event </param>
    // <param name="ta"> Trigger action that is occurring </param>
    public SettingTrigger(Setting__c[] Settings, Setting__c[] oldSettings, SettingUtils.triggerAction ta) 
    {
    
        System.Debug('## >>> ta ' + ta);

        // create a container to bulk insert pay periods
        //List<Time_Range__c> TimeRangesToCreate = new List<Time_Range__c>();
        //DateTime dT = System.now();
        //Date myDate = date.newinstance(dT.year(), dT.month(), dT.day());
        
        // Check if 'isUpdate'
        //Integer count = [select count() from SiteFnc__c where Term__c = :TermToGenD AND Site_Lease__c = :LeaseID];
        //Select count(E.Name) from Employee_Hours__c E GROUP BY E.Employee__s.Setting__c
        //Select E.Employee__s.Setting__c, count(E.Name) from Employee_Hours__c E GROUP BY E.Employee__s.Setting__c
        // Lookup blogs and see if there is a blog that is already marked as "Default".
        //Id defaultBlogId = null;
        //try { 
            //defaultBlogId = [SELECT Id, Default__c FROM Blog__c WHERE Default__c = true LIMIT 1].Id;
        //} catch (Exception e) {
            // If there aren't defualt blogs, we just keep the null value... Do Nothing.
        //}

        //System.Debug('## >>> Settings ' + r);
            
        // loop through trigger records
        for (Setting__c s : Settings)
        {

            System.Debug('## >>> Settings ' + s);
            
            //AFTER INSERT
            if ( ta==SettingUtils.triggerAction.afterInsert )
            {

                // loop 'Default_Pay_Periods__c' times
                //for (Integer i = 1; i <= s.Default_Pay_Periods__c; i++) 
                for (Integer i = 1; i <= 20; i++) 
                {

                    //Time_Range__c tr = new Time_Range__c();
                    //tr.Setting__c = s.Id;

                    //TimeRangesToCreate.add(tr);

                }

            }

            //AFTER UPDATE
            if ( ta==SettingUtils.triggerAction.afterUpdate )
            {
            
            
            

            }

        }

        // bulk insert TimeRangesToCreate
        //if (!TimeRangesToCreate.isEmpty()) {
                //insert TimeRangesToCreate;
        //} 

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
        //List<Setting__c> timerangesToCreate = new List<Setting__c>();
        //List<Setting__c> timerangesToUpdate = new List<Setting__c>();

        //DateTime dt = System.now();
        //Date nowDate = date.newinstance(dT.year(), dT.month(), dT.day());
        
        //Integer i = 0; // processing counter
        
        //for(Setting__c r : TimeRanges) 
        //{
            // AFTER INSERT
            //if (ta==SettingUtils.triggerAction.afterInsert) 
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
            //if (ta==SettingUtils.triggerAction.afterUpdate) 
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