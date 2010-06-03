public class TimewareUtils {

    public static Boolean isTest = false;

    /*
    * @param boolean value
    * @return void 
    */
    public static void setIsTest(Boolean value) {
        TimewareUtils.isTest = value;
    }
    public static Boolean getIsTest() {
        return TimewareUtils.isTest;
    }

    public class TimewareException extends Exception {}
    
    //public static Payroll_System__c get_payroll_system(String payroll_system_name) {
    //  Payroll_System__c result = payroll_system_map.get(payroll_system_name);
    //  if (result == null) {
    //      Payroll_System__c[] systems = [select Id, Name from Payroll_System__c where Name = :payroll_system_name];
    //      if (systems.size() != 1) {
    //          throw new Timeware.Timeware_Exception('This is a sample error message that can be displayed for \'' + payroll_system_name + '\'.');
    //      }
    //  }
    //}
    
    // <name> triggerAction </name>
    // <summary> contains possible actions for a trigger </summary>
    public enum triggerAction {beforeInsert, beforeUpdate, beforeDelete, afterInsert, afterUpdate, afterDelete, afterUndelete}

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
    * SystemUtils
    */
    public static final String LINE_SEPARATOR = '\n';
    public static void debugLimits(){
        System.debug(
              LINE_SEPARATOR + '##################################################################'
            + LINE_SEPARATOR + 'Limits:'
            + LINE_SEPARATOR + '##################################################################'
            + LINE_SEPARATOR + 'AggregateQueries: ' + Limits.getAggregateQueries() + ' of ' + Limits.getLimitAggregateQueries()
            + LINE_SEPARATOR + 'Callouts: ' + Limits.getCallouts() + ' of ' + Limits.getLimitCallouts()
            + LINE_SEPARATOR + 'DMLRows: ' + Limits.getDMLRows() + ' of ' + Limits.getLimitDMLRows()
            + LINE_SEPARATOR + 'DMLStatements: ' + Limits.getDMLStatements() + ' of ' + Limits.getLimitDMLStatements()
            + LINE_SEPARATOR + 'EmailInvocations: ' + Limits.getEmailInvocations() + ' of ' + Limits.getLimitEmailInvocations()
            + LINE_SEPARATOR + 'FieldsDescribes: ' + Limits.getFieldsDescribes() + ' of ' + Limits.getLimitFieldsDescribes()
            + LINE_SEPARATOR + 'FindSimilarCalls: ' + Limits.getFindSimilarCalls() + ' of ' + Limits.getLimitFindSimilarCalls()
            + LINE_SEPARATOR + 'FutureCalls: ' + Limits.getFutureCalls() + ' of ' + Limits.getLimitFutureCalls()
            + LINE_SEPARATOR + 'HeapSize: ' + Limits.getHeapSize() + ' of ' + Limits.getLimitHeapSize()
            + LINE_SEPARATOR + 'Queries: ' + Limits.getQueries() + ' of ' + Limits.getLimitQueries()
            + LINE_SEPARATOR + 'PicklistDescribes: ' + Limits.getPicklistDescribes() + ' of ' + Limits.getLimitPicklistDescribes()
            + LINE_SEPARATOR + 'QueryRows: ' + Limits.getQueryRows() + ' of ' + Limits.getLimitQueryRows()
            + LINE_SEPARATOR + 'RunAs: ' + Limits.getRunAs() + ' of ' + Limits.getLimitRunAs()
            + LINE_SEPARATOR + 'SavepointRollbacks: ' + Limits.getSavepointRollbacks() + ' of ' + Limits.getLimitSavepointRollbacks()
            + LINE_SEPARATOR + 'Savepoints: ' + Limits.getSavepoints() + ' of ' + Limits.getLimitSavepoints()
            + LINE_SEPARATOR + 'ScriptStatements: ' + Limits.getScriptStatements() + ' of ' + Limits.getLimitScriptStatements()
            + LINE_SEPARATOR + 'SoslQueries: ' + Limits.getSoslQueries() + ' of ' + Limits.getLimitSoslQueries()
            );
    }

    /*
    * SystemUtils Test
    */
    //@IsTest
    private static testmethod void testLimitDebug(){
        TimewareUtils.debugLimits();
    }
    

    
}