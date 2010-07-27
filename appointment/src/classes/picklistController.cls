public class picklistController {

    //System object name, such as Account
    private String systemObject;

    public String getSystemObject() {
        return systemObject;
    }

    public void setSystemObject(String value) {
        systemObject = value;
    }

    //picklist name such as "Type" of account object
    private String picklist_Field;

    public String getPicklist_Field() {
        return picklist_Field;
    }

    public void setPicklist_Field(String value) {
        picklist_Field= value;
    }

    //default item's value
    public String listDefaultValue {get;set;}

    //default item's label
    public String listDefaultLabel {get;set;}

    // whether the default item should be shown
    public Boolean haveDefaultValue {get;set;}
    
    /*
    public List getItems() {

        List entries_local;

        if (systemObject != null) {

            //use GlobalDecribe to get a list of all available Objects
            Map gd = Schema.getGlobalDescribe();
            Set objectKeys = gd.keySet();

            for(String objectKey: objectKeys) {

                //Iterate through all objects to locate selected Object
                if (objectKey == systemObject.toLowerCase()) {

                    Schema.SObjectType systemObjectType = gd.get(objectKey);
                    Schema.DescribeSObjectResult r = systemObjectType.getDescribe();
                    Map M = r.fields.getMap();
                    Set fieldNames = M.keySet();

                    if (picklist_Field == null) {
                        break;
                    }

                    //iterate through all fields of the object to locate the picklist field
                    for(String fieldName: fieldNames) {

                        if (fieldName == picklist_Field.toLowerCase()) {

                            Schema.SObjectField field = M.get(fieldName);
                            Schema.DescribeFieldResult fieldDesc = field.getDescribe();

                            //extract the picklist values
                            entries_local = fieldDesc.getPicklistValues();

                            break;

                        }

                    }

                }

            }//end for

        }

        //Loading the picklist values and default item for our selectList
        List options = new List();

        //take care of Default value
        if (haveDefaultValue == true) {

            if (listDefaultValue == null)
            listDefaultValue = '';

            if (listDefaultLabel== null)
            listDefaultLabel = '--None--';

            options.add(new SelectOption(listDefaultValue,listDefaultLabel));

        }

        //take care of picklist values
        if (entries_local != null) {

            for(Schema.PicklistEntry picklistItem : entries_local) {

                options.add(new SelectOption(picklistItem.getValue(),picklistItem.getLabel()));

            }

        }

        return options;

    }
    */
    
}