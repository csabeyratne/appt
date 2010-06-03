public class zLookupToPicklistExtension {

    private final ApexPages.standardController controller;

    private final Employee__c obj;

    public zLookupToPicklistExtension(ApexPages.StandardController stdController) {
        this.controller = stdController;
        this.obj = (Employee__c)stdController.getRecord();
    }

    public SelectOption[] getLocationOptions() {
        SelectOption[] locations = new SelectOption[]{};
        /*locations.add(new SelectOption('','–None–'));*/
        for (Location__c l : [select name, description__c from location__c where active__c = true order by name]) {
            locations.add(new SelectOption(l.name, l.name + ' ' + l.description__c));
        }
        return locations;
    }
}