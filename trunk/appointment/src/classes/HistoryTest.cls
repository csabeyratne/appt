@isTest
private class HistoryTest {

    // Test methods are for Bluehawk Network's InSite product.
    // The object types will need to be changed to valid custom objects for your organization.

    static testmethod void testNotes() {
    
        // Incident__c thisIncident = new Incident__c();
        // insert thisIncident;
        
        // History incidentHistory = new History(thisIncident);
        // incidentHistory.buildEntries();
        // System.assertEquals(0,incidentHistory.events.size());
        
        // Note newNote = new Note(parentId = thisIncident.id, title = 'a new note');
        // insert newNote;
        // incidentHistory.buildEntries();
        // System.assertEquals(1,incidentHistory.events.size());
        
    }
    
    static testmethod void testActivities() {
    
        // Incident__c thisIncident = new Incident__c();
        // insert thisIncident;
        
        // History incidentHistory = new History(thisIncident);
        // incidentHistory.buildEntries();
        // System.assertEquals(0,incidentHistory.events.size());
        
        // Task newTask = new Task(whatId = thisIncident.id, subject='a new Task');
        // insert newTask;
        
        // Event newEvent = new Event(whatId = thisIncident.id,  subject='a new event', DurationInMinutes = 30, ActivityDateTime = Datetime.now(), RecordTypeId = itil_b.Util.getRecordType('Event','ChangeWindow').id );
        // insert newEvent;
        
        // incidentHistory.buildEntries();
        // System.assertEquals(2,incidentHistory.events.size());
        
    }
    
    static testmethod void testHistory() {
    
        //This method contains no assertions because we cannot assert that customers have field history tracking set a specific way.
        // Contact newContact = new Contact(LastName = 'Bob');
        
        // insert newContact;
        // Incident__c thisIncident = new Incident__c();
        // insert thisIncident;
        
        // History incidentHistory = new History(thisIncident);
        // incidentHistory.buildEntries();
        // System.assertEquals(0,incidentHistory.events.size());
        
        // thisIncident.subject__c = 'new subject';
        // update thisIncident;
        
        // thisIncident.Contact__c = newContact.id;
        // update thisIncident;
        
        // Incident__history thisHistory = new Incident__history(parentId = thisIncident.id, field = 'created');
        // insert thisHistory;
        
        // History.FieldHistory thisUpdate = new History.FieldHistory(null, 'oldVal', 'newVal', DateTime.now(), 'subject__c');
        // incidentHistory.injectedResults.add(thisUpdate);
        
        // incidentHistory.buildEntries(); 
        // System.debug('\nIncident History: '+incidentHistory.events);
        
    }
    
    static testmethod void testGeneric() {
    
        // Contact newContact = new Contact(LastName = 'Bob');
        // insert newContact;
        // Incident__c thisIncident = new Incident__c(Contact__c = newContact.id);
        // insert thisIncident;
        
        // History incidentHistory = new History(thisIncident);
        // incidentHistory.buildEntries();
        // System.assertEquals(0,incidentHistory.events.size());
        
        // Worklog__c newWorklog = new Worklog__c(Incident__c = thisIncident.id, name = 'a new worklog');
        // insert newWorklog;
        
        // incidentHistory.buildEntries();
        // System.assertEquals(1,incidentHistory.events.size());
        
    }
    
}