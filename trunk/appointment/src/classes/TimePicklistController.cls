public class TimePicklistController {

    public String starttime {get;set;}
    public String stoptime {get;set;}

    /*
    public List<SelectOption> getstarttimes() {
    
        List<SelectOption> options = new List<SelectOption>();
        List<Time_Range__c> timelist = new List<Time_Range__c>();
        timelist = [Select Id, Start_Time_List__c FROM Time_Range__c ];
        // options.add(new SelectOption('--None--','--None--'));

        for (Integer j=0;j<timelist.size();j++) {
            options.add(new SelectOption(timelist[j].Start_Time_List__c,timelist[j].Start_Time_List__c));
        }

        return options;

    }

    public List<SelectOption> getstoptimes() {
    
        List<SelectOption> options = new List<SelectOption>();
        List<Time_Range__c> timelist = new List<Time_Range__c>();
        timelist = [Select Id, Stop_Time_List__c FROM Time_Range__c ];
        //options.add(new SelectOption('--None--','--None--'));

        for (Integer j=0;j<timelist.size();j++) {
            options.add(new SelectOption(timelist[j].Stop_Time_List__c,timelist[j].Stop_Time_List__c));
        }

        return options;

    }
    */
    
}