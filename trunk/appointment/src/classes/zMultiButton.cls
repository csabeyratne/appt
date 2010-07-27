public class zMultiButton {

    public List<Opportunity> opps {get; set;}
    public List<Account> accts {get; set;}
    public String viewList {get; set;}
    public String searchValue {get; set;}
    public String searchEngine {get; set;}
 
    public zMultiButton(){
        //Query in the contructor for this example
        opps = [select Name, StageName, Amount from Opportunity limit 10];
        accts = [select Name, BillingCity, BillingCountry from Account limit 10];
    }
 
    public void showAccts(){
        viewList = 'accts';
    }
 
    public void showOpps(){
        viewList ='opps';
    }
 
    public pageReference doSearch(){
        PageReference searchPage = new PageReference('http://' + searchEngine + searchVAlue );
        searchPage.setRedirect(true);
        return searchPage;
    }
}