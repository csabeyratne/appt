public class zUserExtensionTest {
    public static testMethod void testUserEdit() {
        //get a user that is not in a system admin profile
        User u = [SELECT Id, Name FROM User WHERE Profile.Name != 'System Administrator' LIMIT 1];
        
        //create a reference to the Visualforce page
        PageReference editPage = Page.zUserExtensionPage;
        Test.setCurrentPage(editPage);
                
        //populate the Visualforce page with the Id of the user from above
        ApexPages.currentPage().getParameters().put('id', u.Id);
        
        //create an instance of the controller extension as if editing the user's details
        ApexPages.StandardController sc = new ApexPages.standardController(u);
        zUserExtension ext = new zUserExtension(sc);
        
        //call the method for populuating the picklist
        List<SelectOption> managerList = ext.getMgrs();
        sc.save();
    }
}