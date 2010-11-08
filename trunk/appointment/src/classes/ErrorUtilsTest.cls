@IsTest
private class ErrorUtilsTest {

    private static testmethod void testHandleError() {
        ErrorUtils.ensureCustomCodeSupportEmailExists(
            new Custom_Code_Support_Email__c(
                name = 'test 123'
                ,Email__c = 'abcd123@test.com'
            )
        );
        Exception sampleException = null;
        try{
            sampleException.getMessage();
        }catch(System.NullPointerException e){
            sampleException = e;
        }
        ErrorUtils.handleError(sampleException);
    }

    private static final String EMAIL_ADDR = 'abcd1234@test.com';

    private static testmethod void testEnsureCustomCodeSupportEmailExists_Exception(){
        System.assertEquals(null,ErrorUtils.ensureCustomCodeSupportEmailExists(null));
    }

    private static testmethod void testEnsureCustomCodeSupportEmailExists_Insert(){
        Custom_Code_Support_Email__c record = new Custom_Code_Support_Email__c(
            name     = 'test 123'
            ,Email__c = EMAIL_ADDR
        );
        record = ErrorUtils.ensureCustomCodeSupportEmailExists(record);
        System.assertNotEquals(null,record);
        System.assertNotEquals(null,record.id);
        try{
            record = [    
               select id 
               from Custom_Code_Support_Email__c 
               where Email__c = :EMAIL_ADDR 
               limit 1 
            ];
        }catch(QueryException e){}
        System.assertNotEquals(null,record);
    }

    private static testmethod void testEnsureCustomCodeSupportEmailExists_UpdateOther(){
        Custom_Code_Support_Email__c record = new Custom_Code_Support_Email__c(
            name     = 'test 123'
            ,Email__c = EMAIL_ADDR
        );
        insert record;
        record = ErrorUtils.ensureCustomCodeSupportEmailExists(record.clone(false));
        System.assertNotEquals(null,record);
        System.assertNotEquals(null,record.id);
        try{
            record = [    
               select id 
               from Custom_Code_Support_Email__c 
               where Email__c = :EMAIL_ADDR 
               limit 1 
            ];
        }catch(QueryException e){}
        System.assertNotEquals(null,record);
    }

    private static testmethod void testEnsureCustomCodeSupportEmailExists_UpdateItself(){
        Custom_Code_Support_Email__c record = new Custom_Code_Support_Email__c(
            name     = 'test 123'
            ,Email__c = EMAIL_ADDR
        );
        insert record;
        record = ErrorUtils.ensureCustomCodeSupportEmailExists(record);
        System.assertNotEquals(null,record);
        System.assertNotEquals(null,record.id);
        try{
            record = [    
               select id 
               from Custom_Code_Support_Email__c 
               where Email__c = :EMAIL_ADDR 
               limit 1 
            ];
        }catch(QueryException e){}
        System.assertNotEquals(null,record);
    }

}