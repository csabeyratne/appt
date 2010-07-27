public class RecordTypeListController {
    private List<SelectOption> items;

    // property that reads the value from the Component attribute
    public string sObjectType {get;set;}

    public List<SelectOption> getItems() {
        List<SelectOption> items = new List<SelectOption>();

        //default value
        items.add(new SelectOption('','--Select Record Type --'));

        //query force.com database to get the record type of the requested object.
        for(RecordType rt: [select id,name from recordtype where sobjecttype=:sObjectType]) {
            items.add(new SelectOption(rt.id,rt.name));
        }
        return items;
    }
}