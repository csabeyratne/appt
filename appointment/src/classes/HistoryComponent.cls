public with sharing class HistoryComponent {

    public sObject subject {get;set;}
    public History thisHistory {get;set;}

    public HistoryComponent() {}

    public void getInit() {
    
        thisHistory = new History(subject);
        thisHistory.buildEntries();
        thisHistory.invertList();

    }

}