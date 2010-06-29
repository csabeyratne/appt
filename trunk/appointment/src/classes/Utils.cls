public class Utils {

    public static Boolean isTest = false;

    /*
    * @param boolean value
    * @return void 
    */
    public static void setIsTest(Boolean value) {
        Utils.isTest = value;
    }
    public static Boolean getIsTest() {
        return Utils.isTest;
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
        Utils.debugLimits();
    }
    
    /*
    * @param string value
    * @return datetime 
    */
    public static DateTime getConvertDateTime(string timeString) {

        // used to convert a picklist time value (Format: "10:45 PM") into
        // a datetime the system can use

        string dateString = '2010-01-03'; // 'YYYY-MM-DD' date doesn't really matter here

        // split string on whitespace or colon
        string splitString = '[\\s:]';
        String[] timeStringDivided = timeString.split(splitString);

        string hour = timeStringDivided.get(0);
        string minute = timeStringDivided.get(1);
        string second = '00';
        
        if (timeStringDivided.get(2) == 'PM') {
            hour = String.valueOf(Integer.valueOf(hour) + 12);
        }

        // create datetime 
        string stringDateTime = dateString + ' ' + hour + ':' + minute +  ':' + second;

        //system.debug('Date: ' + dateString);
        //system.debug('timeStringDivided: ' + timeStringDivided);
        //system.debug('Hour: ' + hour);
        //system.debug('Minute: ' + minute);
        //system.debug('Second: ' + second);
        //system.debug('timeStringDivided.get(2): ' + timeStringDivided.get(2));
        //system.debug('stringDateTime: ' + stringDateTime);
        
        return datetime.valueOf(stringDateTime);
        
    }

    public static integer CalcTimeDuration (string timeString1, string timeString2) {
        
        // calculate the duration in minutes between two picklist time values (Format: "10:45 PM")
        // first time is earlier than second time
        // an Appontment record expects start time and duration in minutes

        integer Duration;
        //string dateString = '2010-01-03'; // 'YYYY-MM-DD' date doesn't really matter here
        
        datetime dt1 = getConvertDateTime(timeString1);
        datetime dt2 = getConvertDateTime(timeString2);
        
        // this function must return a Long
        Long dt1ms = dt1.getTime();
        Long dt2ms = dt2.getTime();
        
        Long Diffms = dt2ms - dt1ms;
        
        // need to cast the long to int (long way around)
        // (see: http://community.salesforce.com/sforce/board/message?board.id=apex&message.id=1881)
        Integer DiffmsInt = Integer.valueOf(String.valueOf(Diffms));
        
        // convert from ms to minutes
        Duration = DiffmsInt / 1000 / 60;
        
        return Duration;

    } 
    
}