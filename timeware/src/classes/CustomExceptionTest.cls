@isTest 
private class CustomExceptionTest {
    
    //
    // Test CustomException
    //
    static testMethod void myUnitTest(){
        
        //GenerateEnvironmentTest.gen();
        TimeWareUtils.setIsTest( true );
        Test.startTest();
        CustomException ce = new CustomException();
        Test.stopTest();
        TimeWareUtils.setIsTest( false );
    }       
}