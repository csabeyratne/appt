public class SettingExtTrigger {

    public List<Setting__c> newValues; // public List newValues;
    public List<Setting__c> oldValues; // public List oldValues; 
    public Map<Id,Setting__c> newMap; // public Map newMap;
    public Map<Id,Setting__c> oldMap; // public Map oldMap;

    public Boolean isInsert = false;  
    public Boolean isUpdate = false;  
    public Boolean isDelete = false;  
    public Boolean isUndelete = false;  
    public Boolean isBefore = false;  
    public Boolean isAfter = false;  
  
    // public SettingExtTrigger(List oldValues,List newValues, Map oldMap, Map newMap) {  
    public SettingExtTrigger(List<Setting__c> oldValues, List<Setting__c> newValues, Map<Id,Setting__c> oldMap, Map<Id,Setting__c> newMap) {  
  
        this.newValues = newValues;  
        this.oldValues = oldValues;  
        this.oldMap = oldMap;  
        this.newMap = newMap;  
  
    }  
    
}