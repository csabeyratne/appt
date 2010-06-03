public class EmployeeHours {

    // <name> EmployeeHours </name>
    // <summary> Default Constructor </summary>
    public EmployeeHours() {}

    // <name> EmployeeHours </name>
    // <summary> Overloads the EmployeeHours object constructor to handle Pay Period processing </summary>
    // <param name="EmployeeHours"> Pay Period objects that are being triggered </param>
    // <param name="oldEmployeeHours"> EmployeeHours object values before trigger event </param>
    // <param name="ta"> Trigger action that is occurring </param>
    public EmployeeHours(Employee_Hours__c[] EmployeeHours, Employee_Hours__c[] oldEmployeeHours, EmployeeHoursUtils.triggerAction ta) 
    {    
        // Pay Period list for termination updates
        List<Employee_Hours__c> employeehoursToCreate = new List<Employee_Hours__c>();
        List<Employee_Hours__c> employeehoursToUpdate = new List<Employee_Hours__c>();

        // processing counter
        Integer i = 0;
        
        for(Employee_Hours__c p : EmployeeHours) 
        {
            // AFTER INSERT
            if (ta==EmployeeHoursUtils.triggerAction.afterInsert) 
            {
                //if (p.Pay_Period_Week__c == null)
                //{
                    //employeehoursToCreate.add(p);
                //}
                //if (p.Pay_Period_Week__c != null)
                //{
                    //employeehoursToUpdate.add(p);
                //}
            }
            
            // AFTER UPDATE
            if (ta==EmployeeHoursUtils.triggerAction.afterUpdate) 
            {
                //if (p.Pay_Period_Week__c == oldEmployeeHours[i].Pay_Period_Week__c)
                //{
                    //employeehoursToUpdate.add(p);
                //}
            }

            i += 1;
        }

        if (employeehoursToCreate.size() > 0 ) {
            createPayPeriod(employeehoursToCreate);
        }
        if (employeehoursToUpdate.size() > 0 ) {
            updatePayPeriod(employeehoursToUpdate);
        }
    }

    // <name> createPayPeriod </name>
    // <summary> Inserts a new Pay Period Week After a Pay Period is Inserted</summary>
    // <param name="EmployeeHours">  </param>
    public static void createPayPeriod(Employee_Hours__c[] EmployeeHours)
    {
        List<Employee_Hours__c> employeehoursToCreate = new List<Employee_Hours__c>();
        //List<Employee_Hours__c> employeehoursToUpdate = new List<Employee_Hours__c>();
        
        for(Employee_Hours__c p : EmployeeHours) 
        {
            //Pay_Period_Week__c copy = new Pay_Period_Week__c();
            //copy.Contact__c = p.RelatedContact__c;
            //copy.RelatedContact__c = p.Contact__c;
            //copy.Status__c = p.Status__c;
            //copy.Type__c = p.Type__c;
            //copy.ReciprocalEmployee_Hours__c = p.Id;
            //copy.Description__c = p.Description__c;
            //employeehoursToCreate.add(copy);
        }

        //insert employeehoursToCreate;

    }

    // <name> updatePayPeriod </name>
    // <summary> Updates the Status and/or Type of a Pay Period After its reciprocal has been updated </summary>
    // <param name="EmployeeHours">  </param>
    // <param name="oldEmployeeHours">  </param>
    public static void updatePayPeriod(Employee_Hours__c[] EmployeeHours)
    {
        //List<Employee_Hours__c> employeehoursToCreate = new List<Employee_Hours__c>();
        List<Employee_Hours__c> employeehoursToUpdate = new List<Employee_Hours__c>();
        
        // processing counter
        Integer counter = 0;

        for(Employee_Hours__c p : EmployeeHours) 
        {
            //SWA 2009-05-13 removed a duplicate check for change to Status__c from this OR statement
            //if ((p.Status__c != oldEmployeeHours[counter].Status__c || p.Type__c != oldEmployeeHours[counter].Type__c || p.Description__c != oldEmployeeHours[counter].Description__c)&& p.ReciprocalEmployee_Hours__c != null)
            //{
                //Employee_Hours__c copy = new Employee_Hours__c(Id=p.ReciprocalEmployee_Hours__c);
                
                //SWA 2009-05-13 - only attempt to modify the Contact field if the Related Contact has changed
                //if(oldEmployeeHours[counter].RelatedContact__c!=p.RelatedContact__c){
                    //copy.Contact__c = p.RelatedContact__c;
                //}
                //copy.Status__c = p.Status__c;
                //copy.Type__c = p.Type__c;
                //copy.Description__c = p.Description__c;
                //employeehoursToUpdate.add(copy);
            //}
            counter += 1;
        }
        //update employeehoursToUpdate;
    }
    
}