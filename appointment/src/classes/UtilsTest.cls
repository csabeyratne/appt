@IsTest
private class UtilsTest {

    private static testmethod void testHandleError() {
        Utils.ensureCustomCodeSupportEmailExists(
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
        Utils.handleError(sampleException);
    }

    private static final String EMAIL_ADDR = 'abcd1234@test.com';

    private static testmethod void testEnsureCustomCodeSupportEmailExists_Exception(){
        System.assertEquals(null,Utils.ensureCustomCodeSupportEmailExists(null));
    }

    private static testmethod void testEnsureCustomCodeSupportEmailExists_Insert(){
        Custom_Code_Support_Email__c record = new Custom_Code_Support_Email__c(
            name     = 'test 123'
            ,Email__c = EMAIL_ADDR
        );
        record = Utils.ensureCustomCodeSupportEmailExists(record);
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
        record = Utils.ensureCustomCodeSupportEmailExists(record.clone(false));
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
        record = Utils.ensureCustomCodeSupportEmailExists(record);
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

    /* ============================================================
    * This code is part of the "apex-lang" open source project avaiable at:
    * 
    *      http://code.google.com/p/apex-lang/
    *
    * This code is licensed under the Apache License, Version 2.0.  You may obtain a 
    * copy of the License at:
    * 
    *      http://www.apache.org/licenses/LICENSE-2.0
    * ============================================================ */

    /*
    * SystemUtils Test
    */
    //@IsTest
    private static testmethod void testLimitDebug(){
        Utils.debugLimits();
    }

}