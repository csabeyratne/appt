public class zCategorySearchController {

    // the results from the search. do not init the results or a blank rows show up initially on page load
    public List<zCategoryWrapper> searchResults {get;set;}
    // the categories that were checked/selected.
    public List<zCategoryWrapper> selectedCategories {
        get {
            if (selectedCategories == null) selectedCategories = new List<zCategoryWrapper>();
            return selectedCategories;
        }
        set;
    }       

    // the text in the search box
    public string searchText {
        get {
            if (searchText == null) searchText = 'Category'; // prefill the search box for ease of use
            return searchText;
        }
        set;
    }  

    // constructor
    public zCategorySearchController() {}

    // fired when the search button is clicked
    public PageReference search() {

        if (searchResults == null) {
            searchResults = new List<zCategoryWrapper>(); // init the list if it is null
        } else {
            searchResults.clear(); // clear out the current results if they exist
        }
        // Note: you could have achieved the same results as above by just using:
        // searchResults = new List<zCategoryWrapper>();

        // dynamic soql for fun
        String qry = 'Select c.Name__c From zCat3__c c Where c.Name__c LIKE \'%'+searchText+'%\' Order By c.Name__c';
        // may need to modify for governor limits??
        for(zCat3__c c : Database.query(qry)) {
            // create a new wrapper by passing it the category in the constructor
            zCategoryWrapper cw = new zCategoryWrapper(c);
            // add the wrapper to the results
            searchResults.add(cw);
        }
        return null;
    }    

    public PageReference next() {

        // clear out the currently selected categories
        selectedCategories.clear();

        // add the selected categories to a new List
        for (zCategoryWrapper cw : searchResults) {
            if (cw.checked)
                selectedCategories.add(new zCategoryWrapper(cw.cat));
        }

        // ensure they selected at least one category or show an error message.
        if (selectedCategories.size() > 0) {
            return Page.zCategoryResultsPage;
        } else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please select at least one Category.'));
            return null;
        }        

    }        

    // fired when the back button is clicked
    public PageReference back() {
        return Page.zCategorySearchPage;
    }        

}