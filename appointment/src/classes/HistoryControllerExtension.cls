public with sharing class HistoryControllerExtension{

    public History thisHistory {get;set;}
    
    public HistoryControllerExtension(ApexPages.StandardController sc){
        sObject thisObject = sc.getRecord();
        thisHistory = new History(thisObject);
        thisHistory.buildEntries();
        thisHistory.invertList();
    }
    
    public HistoryControllerExtension(){
        id currentId = ApexPages.currentPage().getParameters().get('id');
        sObject thisObject = Utils.getAllFields(currentId);
        thisHistory = new History(thisObject);
        thisHistory.buildEntries();
        thisHistory.invertList();
    }

}