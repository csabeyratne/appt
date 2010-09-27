/*
@Author: Siddhesh Kabe
@Domain: http://force.siddheshkabe.co.in
Controller for Visualforce inPlaceAccounts.page
*/

public class zInPlaceAccountsController {

    public zInPlaceAccountsController() {
        newAccount= new Account(); // Create a new object for account.
    }
 
    public Account newAccount {get;set;} // A Account variable to add a new account in the place.
    public Account editAccount {get; set;} // A temporary variable to store the existing account in place.
     
    /*
    @Function: getProjects
    @params: None
    @Return Type: List of Accounts to display
    @Usage: The getter method to fetch Accounts.
    */
    public Account[] getProjects() {
        return [SELECT Name,AnnualRevenue from ACCOUNT WHERE OwnerId = :UserInfo.getUserId() ORDER BY CreatedDate DESC];
    }
     
    /*
    @Function: getParam
    @Param: String, the Parameter name to fetch value from.
    @Return Type: String, The value of the URL paramter.
    @Usage: The getter method to fetch Accounts.
    */
    public String getParam(String name) {
        return ApexPages.currentPage().getParameters().get(name);  
    }
     
    /*
     Action method to add new account.
    */
    public PageReference add() {
        try {
            INSERT newAccount;
            // if successful, reset the new Account for the next entry
            newAccount = new Account();
        } catch (Exception e) {
            ApexPages.addMessages(e);
        }
        return null;
    }
      
    /*
     Action method to del a account.
    */
    public PageReference del() {
        try {
            String delid = getParam('delid');
            Account delAccount = [SELECT Id FROM Account WHERE ID=:delid];
            DELETE delAccount;
        } catch (Exception e) {
            ApexPages.addMessages(e);
        }
        return null;
    }
     
    /*
     Action method to edit a account.
    */     
    public PageReference editAcc() {
        String editid = getParam('editid');
        editAccount= [SELECT Name,AnnualRevenue FROM Account WHERE Id=:editid];
        return null;
    }
     
    /*
     Action method to cancel new account.
    */
     public PageReference cancelEdit() {
        editAccount= null;
        return null;
    }
     
    /*
     Action method to save the edited account.
    */
    public PageReference saveEditAcc() {
        try {
            UPDATE editAccount;
            editAccount= null;
        } catch (Exception e) {
            ApexPages.addMessages(e);
        }
        return null;
    }

}