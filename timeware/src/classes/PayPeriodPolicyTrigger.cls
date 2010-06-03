public class PayPeriodPolicyTrigger {

    // <name> PayPeriodPolicyTrigger </name>
    // <summary> Default Constructor </summary>
    public PayPeriodPolicyTrigger () {}

    // <name> PayPeriodPolicyTrigger </name>
    // <summary> Overloads the PayPeriodPolicyTrigger object constructor to handle Pay Period Policy processing </summary>
    // <param name="PayPeriodPolicies"> Pay Period Policy objects that are being triggered </param>
    // <param name="oldPayPeriodPolicies"> Pay Period Policy object values before trigger event </param>
    // <param name="ta"> Trigger action that is occurring </param>
    public PayPeriodPolicyTrigger(Pay_Period_Policy__c[] PayPeriodPolicies, Pay_Period_Policy__c[] oldPayPeriodPolicies, TimewareUtils.triggerAction ta) 
    {
    
        System.Debug('## >>> ta ' + ta);

        // create a container to bulk insert pay periods
        List<Pay_Period__c> PayPeriodsToCreate = new List<Pay_Period__c>();
        //DateTime dT = System.now();
        //Date myDate = date.newinstance(dT.year(), dT.month(), dT.day());
        
        // Check if 'isUpdate'
        //Integer count = [select count() from SiteFnc__c where Term__c = :TermToGenD AND Site_Lease__c = :LeaseID];
        //Select count(E.Name) from Employee_Hours__c E GROUP BY E.Employee__r.Pay_Period_Policy__c
        //Select E.Employee__r.Pay_Period_Policy__c, count(E.Name) from Employee_Hours__c E GROUP BY E.Employee__r.Pay_Period_Policy__c
        // Lookup blogs and see if there is a blog that is already marked as "Default".
        //Id defaultBlogId = null;
        //try { 
            //defaultBlogId = [SELECT Id, Default__c FROM Blog__c WHERE Default__c = true LIMIT 1].Id;
        //} catch (Exception e) {
            // If there aren't defualt blogs, we just keep the null value... Do Nothing.
        //}

        //System.Debug('## >>> PayPeriodPolicies ' + r);
            
        // loop through trigger records
        for (Pay_Period_Policy__c r : PayPeriodPolicies)
        {

            System.Debug('## >>> PayPeriodPolicies ' + r);
            
            //AFTER INSERT
            if ( ta==TimewareUtils.triggerAction.afterInsert )
            {

                // loop 'Default_Pay_Periods__c' times
                for (Integer i = 1; i <= r.Default_Pay_Periods__c; i++) 
                {

                    Pay_Period__c pp = new Pay_Period__c();
                    pp.Pay_Period_Policy__c = r.Id;

                    // set first Pay Period to Current
                    if ( i == 1 ) {
                        pp.Current_Pay_Period__c = true;
                    }

                    if (r.Pay_Frequency__c == 'Weekly') {
                        pp.Pay_Period_End__c = r.Effective_Date__c - 1 + (7 * i);
                        pp.Work_Week_End__c = r.Effective_Date__c - 1 + (7 * i);
                    }
                    else if(r.Pay_Frequency__c == 'Bi-Weekly'){
                        pp.Pay_Period_End__c = r.Effective_Date__c - 1 + (14 * i);
                        pp.Work_Week_End__c = pp.Pay_Period_End__c - 7;
                    }
                    else if(r.Pay_Frequency__c == 'Semi-Monthly'){
                        //Date myDate = date.newinstance(dT.year(), dT.month(), dT.day());
                        //Date currentdate = date.today();
                        //Date currentweekstart = currentdate.toStartofWeek()+1;
                        //Date currentweekend = currentweekstart +6;  
                        //Date oldestweekstart = currentweekstart - 7;
                        //Date oldestweekend; 

                        //pp.Pay_Period_End__c = r.Effective_Date__c - 1 + (14 * i);
                        //pp.Work_Week_End__c = r.Effective_Date__c - 1 + (14 * i);
                    }
                    else if(r.Pay_Frequency__c == 'Monthly'){
                        //Date myDate = date.newinstance(dT.year(), dT.month(), dT.day());
                        //pp.Pay_Period_End__c = r.Effective_Date__c - 1 + (14 * i);
                        //pp.Work_Week_End__c = r.Effective_Date__c - 1 + (14 * i);
                    }

                    PayPeriodsToCreate.add(pp);

                }

            }

            //AFTER UPDATE
            if ( ta==TimewareUtils.triggerAction.afterUpdate )
            {
            
            
            

            }

        }

        // bulk insert PayPeriodsToCreate
        if (!PayPeriodsToCreate.isEmpty()) {
                insert PayPeriodsToCreate;
        } 

        // bulk update PayPeriodsToUpdate
        //if (!PayPeriodsToUpdate.isEmpty()) {
        //    try {
        //        update PayPeriodsToUpdate;
        //    } catch (Exception e){
        //        for (Integer i : queueIds.keySet())
        //        {
        //            Trigger.new[i].addError('ERROR: Could not update Assignment Group records ' + ' DETAIL: '+e.getMessage());  
        //        }
        //    }
        //}

        // Pay Period list for termination updates
        //List<Pay_Period_Policy__c> payperiodsToCreate = new List<Pay_Period_Policy__c>();
        //List<Pay_Period_Policy__c> payperiodsToUpdate = new List<Pay_Period_Policy__c>();

        //DateTime dt = System.now();
        //Date nowDate = date.newinstance(dT.year(), dT.month(), dT.day());
        
        //Integer i = 0; // processing counter
        
        //for(Pay_Period_Policy__c r : PayPeriods) 
        //{
            // AFTER INSERT
            //if (ta==TimewareUtils.triggerAction.afterInsert) 
            //{
                //if (pp.Pay_Period__c == null)
                //{
                    //payperiodsToCreate.add(pp);
                //}
                //if (pp.Pay_Period__c != null)
                //{
                    //payperiodsToUpdate.add(pp);
                //}
            //}
            
            // AFTER UPDATE
            //if (ta==TimewareUtils.triggerAction.afterUpdate) 
            //{
                //if (pp.Pay_Period__c == oldPayPeriods[i].Pay_Period__c)
                //{
                    //payperiodsToUpdate.add(pp);
                //}
            //}

            //i += 1;
        //}

        //if (payperiodsToCreate.size() > 0 ) {
            //createPayPeriod(payperiodsToCreate);
        //}
        //if (payperiodsToUpdate.size() > 0 ) {
            //updatePayPeriod(payperiodsToUpdate);
        //}

    }

    // <name> createPayPeriod </name>
    // <summary> Inserts a new Pay Period Week After a Pay Period is Inserted</summary>
    // <param name="PayPeriods">  </param>
    //public static void createPayPeriod(Pay_Period_Policy__c[] PayPeriods)
    //{
        //List<Pay_Period_Policy__c> payperiodsToCreate = new List<Pay_Period_Policy__c>();
        //List<Pay_Period_Policy__c> payperiodsToUpdate = new List<Pay_Period_Policy__c>();
        
        //for(Pay_Period_Policy__c pp : PayPeriods) 
        //{
            //Pay_Period__c copy = new Pay_Period__c();
            //copy.Contact__c = pp.RelatedContact__c;
            //copy.RelatedContact__c = pp.Contact__c;
            //copy.Status__c = pp.Status__c;
            //copy.Type__c = pp.Type__c;
            //copy.ReciprocalPay_Period_Policy__c = pp.Id;
            //copy.Description__c = pp.Description__c;
            //payperiodsToCreate.add(copy);
        //}

        //insert payperiodsToCreate;

    //}

    // <name> updatePayPeriod </name>
    // <summary> Updates the Status and/or Type of a Pay Period After its reciprocal has been updated </summary>
    // <param name="PayPeriods">  </param>
    // <param name="oldPayPeriods">  </param>
    //public static void updatePayPeriod(Pay_Period_Policy__c[] PayPeriods)
    //{
        //List<Pay_Period_Policy__c> payperiodsToCreate = new List<Pay_Period_Policy__c>();
        //List<Pay_Period_Policy__c> payperiodsToUpdate = new List<Pay_Period_Policy__c>();
        
        // processing counter
        //Integer counter = 0;

        //for(Pay_Period_Policy__c pp : PayPeriods) 
        //{
            //SWA 2009-05-13 removed a duplicate check for change to Status__c from this OR statement
            //if ((pp.Status__c != oldPayPeriods[counter].Status__c || pp.Type__c != oldPayPeriods[counter].Type__c || pp.Description__c != oldPayPeriods[counter].Description__c)&& pp.ReciprocalPay_Period_Policy__c != null)
            //{
                //Pay_Period_Policy__c copy = new Pay_Period_Policy__c(Id=pp.ReciprocalPay_Period_Policy__c);
                
                //SWA 2009-05-13 - only attempt to modify the Contact field if the Related Contact has changed
                //if(oldPayPeriods[counter].RelatedContact__c!=pp.RelatedContact__c){
                    //copy.Contact__c = pp.RelatedContact__c;
                //}
                //copy.Status__c = pp.Status__c;
                //copy.Type__c = pp.Type__c;
                //copy.Description__c = pp.Description__c;
                //payperiodsToUpdate.add(copy);
            //}
            //counter += 1;
        //}
        //update payperiodsToUpdate;
    //}
    
}