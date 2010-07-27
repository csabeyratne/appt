public class zProjectsController { 
    
    public zProjectItem__c newProject { get; set; }
    
    public zProjectItem__c editProject { get; set; }

    public zProjectsController() {
        newProject = new zProjectItem__c();
    }
    
    public zProjectItem__c[] getProjects() {
        return [SELECT Name, Status__c, Weighting__c FROM zProjectItem__c WHERE OwnerId = :UserInfo.getUserId() 
                ORDER BY CreatedDate DESC];
    }
    
    public String getParam(String name) {
        return ApexPages.currentPage().getParameters().get(name);   
    }
    
    public PageReference add() {
        try {
            INSERT newProject;
            // if successful, reset the new project for the next entry
            newProject = new zProjectItem__c();
        } catch (Exception e) {
            ApexPages.addMessages(e);
        }
        return null;
    }
     
    public PageReference del() {
        try {
            String delid = getParam('delid');
            zProjectItem__c project = [SELECT Id FROM zProjectItem__c WHERE ID=:delid];
            DELETE project;
        } catch (Exception e) {
            ApexPages.addMessages(e);
        }
        return null;
    }
    
    public PageReference edit() {
        String editid = getParam('editid');
        editProject = [SELECT Name, Status__c, Weighting__c FROM zProjectItem__c WHERE Id=:editid];
        return null;
    }
    
    public PageReference cancelEdit() {
        editProject = null;
        return null;
    }
    
    public PageReference saveEdit() {
        try {
            UPDATE editProject;
            editProject = null;
        } catch (Exception e) {
            ApexPages.addMessages(e);
        }
        return null;
    }
        
}