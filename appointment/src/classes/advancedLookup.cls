public class advancedLookup{
 
    public Object selectValue{get; set;}
    public String objectType {get; set;}
    public String searchValue {get; set;}
    public Integer maxHeight {get; set;}
    public Integer height {get; set;}
    public List<SelectOption> results {get; set;}
    public Boolean showList {get; set;}
    Map<String,String> resultsMap;
 
    //This is our seach method that is called every time a character is entered
    public void search(){
        showList = true;
        results = new List<SelectOption>();
        resultsMap = new Map<String,String>();
 
        //Using dynamic SOQL we pass the object and the search value
        if(searchValue.length() > 0){
            String entry = '%' + searchValue + '%';
            String queryString = 'Select Id, Name from ' + objectType + ' where Name like :entry order by Name limit 1000';
 
            /*Next we add the results to our list of selectOptions. We also add the values to a map so that when a value
            is selected we can auto fill the search box with the selected value */
            for(sObject o : Database.query(queryString)){
                results.add(new SelectOption((String)o.get('Id'),(String)o.get('Name')));
                resultsMap.put((String)o.get('Id'),(String)o.get('Name'));
            }
        }
 
        //Next we inspect the results to set the height and contents of the selectList
        if(searchValue.length() == 0){
            showList = false;
        }else if(results.size() == 0 && searchValue.length() != 0){
            results.add(new SelectOption('','No matches found'));
            height = 2;
        }else if(results.size() == 1){
            height = 2;
        }else if(results.size() > maxHeight){
            height = maxHeight;
        }else{
            height = results.size();
        }
    }
 
    //When a value is selected we will auto complete the searchValue
    public void selectValue(){
        showList = false;
        searchValue = resultsMap.get((string)selectValue);
    }
 
    //simply hides the list of results
    public void hideResults(){
        showList = false;
    }
}