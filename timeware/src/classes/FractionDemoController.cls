public class FractionDemoController {

    public double denominator {get; set;}
    public String result {get; set;}
    

    public void divide(){
        try{
            result = FractionUtility.getFractionalValue(denominator).format();
        }
        catch(Exception ex){
            ApexPages.addMessages(ex);
            result = '';
        }
    }
    
    public static testMethod void testMyController() {
        // 1. Set up all conditions for testing
        double valueToTest = 2;
        double expectedResult = 0.5;
        
        PageReference p = Page.FractionDemo;
        Test.setCurrentPage(p);
        FractionDemoController con = new FractionDemoController();
        con.denominator = valueToTest;
        
        // 2. Call the method(s) being tested.
        con.divide();
                
        // 3. Verify the results are correct.
        System.assertEquals(expectedResult.format(), con.result);
     }


}