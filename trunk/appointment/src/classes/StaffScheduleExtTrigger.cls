public class StaffScheduleExtTrigger {

    public List<Staff_Schedule__c> newValues; // public List newValues;
    public List<Staff_Schedule__c> oldValues; // public List oldValues; 
    public Map<Id,Staff_Schedule__c> newMap; // public Map newMap;
    public Map<Id,Staff_Schedule__c> oldMap; // public Map oldMap;

    public Boolean isInsert = false;  
    public Boolean isUpdate = false;  
    public Boolean isDelete = false;  
    public Boolean isUndelete = false;  
    public Boolean isBefore = false;  
    public Boolean isAfter = false;  
  
    public StaffScheduleExtTrigger(List<Staff_Schedule__c> oldValues, List<Staff_Schedule__c> newValues, Map<Id,Staff_Schedule__c> oldMap, Map<Id,Staff_Schedule__c> newMap) {  
  
        this.newValues = newValues;  
        this.oldValues = oldValues;  
        this.oldMap = oldMap;  
        this.newMap = newMap;  
  
    }  
    
}