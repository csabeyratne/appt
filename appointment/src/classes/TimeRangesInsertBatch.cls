global class TimeRangesInsertBatch implements Database.Batchable<SObject>, Database.Stateful {

    public List<id> timesToInsert = new List<id>();

    //private List<String>            aptIds              { get; set; }
    
    /**
    * Constructor
    */
    //public TimeRangesInsertBatch( List<String> apttIds ) {
    //    this.aptIds = apttIds;
    //}
    
    /**
    * QueryLocator: Select the List of APTaskTemplate__c.
    */
    global Database.QueryLocator start(Database.BatchableContext BC) {

        String query='select a.id, a.Sector_Region__c, a.Owner.Super_Sector_Region__c'+' from Account a where a.OwnerId IN :usersToUpdate';

        return Database.getQueryLocator(query);

    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {

        List<Account> accns = new List<Account>();

        for(sobject s : scope){

            Account a = (Account)s;

            //if(a.Sector_Region__c != a.Owner.Super_Sector_Region__c)
            //a.Sector_Region__c = a.Owner.Super_Sector_Region__c;

            accns.add(a);

        }

        update accns;

        system.debug('####### Number of accounts updated'+accns.size());

    }

    global void finish(Database.BatchableContext BC) {} //Do nothing

}