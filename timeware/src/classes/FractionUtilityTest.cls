@isTest
private class FractionUtilityTest {

    static testMethod void positiveUnitTest() {
        // 1. Set up all conditions for testing
        double valueToTest = 2;
        double expectedResult = 0.5;
        
        // 2. Call the method being tested
        double actualResult = FractionUtility.getFractionalValue(valueToTest);
        
        // 3. Verify the results are correct    
        System.assertEquals(expectedResult, actualResult);
        
        // 4. Run the test! 
    }
    
    static testMethod void negativeCaseUnitTest() {
        // 1. Set up all conditions for testing
        double valueToTest = -2;
        double expectedResult = -0.5;
        
        // 2. Call the method being tested
        double actualResult = FractionUtility.getFractionalValue(valueToTest);
        
        // 3. Verify the results are correct    
        System.assertEquals(expectedResult, actualResult); 
        
        
     }
}