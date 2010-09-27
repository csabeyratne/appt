public class StaffServiceSOQLQuery {

    // Staff_Service__c[] ssj = [
    List<Staff_Service__c> ssj = [
        select Staff__r.Id, Staff__r.Name, Staff__r.Full_Name__c, Service__r.Id, Service__r.Name, Service__r.Service_Category__c
        from Staff_Service__c
        // where Policy__c = :policyId
        ];
        
    //List<Staff__c> staffing = new List<Staff__c>();
    //List<Service__c> services = new List<Service__c>();
    
    //for (Staff_Service__c ss : ssj) {
    
        //if (ss.Staff__r != null) {
        //    staffing.add(ss.Staff__r);
        //}
        //if (ss.Service__r != null) {
        //    services.add(ss.Service__r);
        //}
        
    //}
    
}