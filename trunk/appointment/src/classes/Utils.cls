public with sharing class Utils {

    // IMPORTANT: Enables minimized JS and CSS files for Production Release
    public static Boolean isProduction = false;

    // Usage:
    // Add in the Constructor for the Page Controller
    // public Boolean isProduction {set;get;}
    // public InstallController(){
    //     this.isProduction = ProjectUtil.isProduction;
    // }
    // Add in the Page or Component
    // <apex:outputPanel rendered="{!isProduction}">

    public static Boolean inFutureContext = false; // Prevent recursive future method calls
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

    public class CustomException extends Exception {}
    // Ex. throw new Utils.CustomException('This is a sample error message that can be displayed for \'' + <field-name> + '\'.');
    
    // <name> triggerAction </name>
    // <summary> contains possible actions for a trigger </summary>
    // public enum triggerAction {beforeInsert, beforeUpdate, beforeDelete, afterInsert, afterUpdate, afterDelete, afterUndelete}

    /*
    * getConvertDateTime Class
    * Created by: Matthew Leahy
    * @param string value (Format '10:45 PM')
    * @return datetime 
    */
    public static DateTime getConvertDateTime(string timeString) {
    
        // System.Debug('## >>> START Class getConvertDateTime(string timeString)'); 

        // Used to convert a picklist time value (Format: '10:45 PM') into a datetime the system can use

        // Split string on whitespace or colon
        string splitString = '[\\s:]';
        String[] timeStringDivided = timeString.split(splitString);

        // System.Debug('## >>> timeStringDivided: ' + timeStringDivided);
        // System.Debug('## >>> timeStringDivided.get(0): ' + timeStringDivided.get(0));
        // System.Debug('## >>> timeStringDivided.get(1): ' + timeStringDivided.get(1));
        // System.Debug('## >>> timeStringDivided.get(2): ' + timeStringDivided.get(2));

        string hour = timeStringDivided.get(0);
        string minute = timeStringDivided.get(1);
        
        if ( (timeStringDivided.get(2) == 'PM') && (timeStringDivided.get(0) <> '12') ) {
            hour = String.valueOf(Integer.valueOf(hour) + 12);
        }

        Datetime dtTime = Datetime.newInstance(2010, 1, 3, Integer.valueOf(hour), Integer.valueOf(minute), 0); // Date value doesn't matter

        // System.Debug('## >>> Hour: ' + hour);
        // System.Debug('## >>> Minute: ' + minute);
        // System.Debug('## >>> dtTime: ' + dtTime);
        
        return dtTime;

    }

    /*
    * CalcTimeDuration Class
    * Created by: Matthew Leahy
    * @param string value (Format '10:45 PM')
    * @param string value (Format '10:45 PM')
    * @return datetime 
    */
    public static integer CalcTimeDuration (string timeString1, string timeString2) {
        
        // System.Debug('## >>> START Class CalcTimeDuration (string timeString1, string timeString2)');
        
        // Calculate the duration in minutes between two picklist time values (Format: '10:45 PM')
        // First time is earlier than second time
        // Appointment record expects start time and duration in minutes

        integer Duration;
        
        datetime dt1 = getConvertDateTime(timeString1);
        datetime dt2 = getConvertDateTime(timeString2);
        
        // Function must return a Long
        Long dt1ms = dt1.getTime();
        Long dt2ms = dt2.getTime();
        
        Long Diffms = dt2ms - dt1ms;
        
        // Need to cast the long to int (long way around)
        // (see: http://community.salesforce.com/sforce/board/message?board.id=apex&message.id=1881)
        Integer DiffmsInt = Integer.valueOf(String.valueOf(Diffms));
        
        // Convert from ms to minutes
        Duration = DiffmsInt / 1000 / 60;
        
        return Duration;

    } 
    
    /*
    * TimeConversions Class
    * Created by: Michael Smith/Force2b, 04/06/2010
    */
    public class TimeConversions {

        /* -------------------------------------------------------------------------------------
        * Returns an Integer  of the Timezone Offset from Eastern Time for the
        * currently logged in user
        *
        * This is used to convert the String DateTime (that is in Eastern Time) into a
        * DateTime value in SalesForce. The default behavior of SFC converts the string into
        * a local datetime value, but we need to get into Eastern Time.
        * ------------------------------------------------------------------------------------- */
        public Integer getCurrentUserTZOffsetFromEastern() {

            Map<String, Integer[]> tzSIDKeys = getTZSidKeys();

            User user = [SELECT ID, TimeZoneSidKey FROM User WHERE ID = :UserInfo.getUserId() LIMIT 1];

            Date[] dstDatesNow = getDSTDates(System.Today().year());
            Integer UsersTZOffset = 0;

            if (tzSIDKeys.get(user.TimeZoneSidKey) != null) {

                // Get the base timezone offset from GMT for the user
                if (System.Today() >= dstDatesNow[0] && System.Today() <= dstDatesNow[1]) UsersTZOffset = tzSIDKeys.get(user.TimeZoneSidKey)[1];
                else UsersTZOffset = tzSIDKeys.get(user.TimeZoneSidKey)[0];
                
                system.debug(LoggingLevel.Error, 'Base TimeZone for Current User=' + user.TimeZoneSidKey + '/' + UsersTZOffset );
         
                // Now make it a timezone offset from EASTERN time
                Integer EasternTZOffset = 0;
                if (System.Today() >= dstDatesNow[0] && System.Today() <= dstDatesNow[1]) EasternTZOffset = tzSIDKeys.get('America/New_York')[1];
                else EasternTZOffset = tzSIDKeys.get('America/New_York')[0];
                UsersTZOffset = Math.abs(EasternTZOffset) - Math.abs(UsersTZOffset);

                system.debug(LoggingLevel.Error, 'TimeZone Offset to Eastern Time=' + UsersTZOffset );

            }

            return UsersTZOffset ;

        }

        /* -------------------------------------------------------------------------------------
        * Returns a String Collection of the Timezone Codes based on the Timezone Offset Passed
        * for the date passed.
        *
        * Based on a table from: http://en.wikipedia.org/wiki/Zone.tab
        *
        * getTimeZoneCode[0] = Display Text (ex: EDT)
        * getTimeZoneCode[1] = DateTime.Format() parameter (ex: America/New_York)
        * ------------------------------------------------------------------------------------- */
        public string[] getTimeZoneCode(Integer tzOffset, Date theDate, Boolean isDSTObserved) {

            Date[] dstDates = getDSTDates(theDate.year()); // [0]=startDate, [1]=endDate
            boolean isDSTOn = (theDate >= dstDates[0] && theDate <= dstDates[1]);
      
            if (tzOffset == 0) return new String[]{' GMT', 'Europe/London' };
            else if (tzOffset == 4) return new String[]{' AST (UTC-04)', 'America/Puerto_Rico' };
            else if (tzOffset == 5 && isDSTOn && isDSTObserved) return new String[]{' EDT (UTC-04)', 'America/New_York' };
            else if (tzOffset == 5) return new String[]{' EST (UTC-05)', 'America/New_York' };
            else if (tzOffset == 6 && isDSTOn && isDSTObserved) return new String[]{' CDT (UTC-05)', 'America/Chicago' };
            else if (tzOffset == 6) return new String[]{' CST (UTC-06)', 'America/Chicago' };
            else if (tzOffset == 7 && !isDSTObserved) return new String[]{' MST (UTC-07)', 'America/Phoenix' };
            else if (tzOffset == 7 && isDSTOn && isDSTObserved) return new String[]{' MDT (UTC-06)', 'America/Denver' };
            else if (tzOffset == 7) return new String[]{' MST (UTC-07)', 'America/Denver' };
            else if (tzOffset == 8 && isDSTOn && isDSTObserved) return new String[]{' PDT (UTC-07)', 'America/Los_Angeles' };
            else if (tzOffset == 8) return new String[]{' PST (UTC-08)', 'America/Los_Angeles' };
            else if (tzOffset == 9 && isDSTOn && isDSTObserved) return new String[]{' AKDT (UTC-08)', 'America/Anchorage' };
            else if (tzOffset == 9) return new String[]{' AKST (UTC-09)', 'America/Anchorage' };
            else if (tzOffset == 10 && !isDSTObserved) return new String[]{' HST (UTC-10)', 'Pacific/Honolulu' };
            else if (tzOffset == 10 && isDSTOn && isDSTObserved) return new String[]{' HDT (UTC-09)', 'America/Adak' };
            else if (tzOffset == 10) return new String[]{' HST (UTC-10)', 'America/Adak' };
            else if (tzOffset == 11) return new String[]{' HST (UTC-10)', 'Pacific/Pago_Pago' };
            else return new String[]{' UTC-' + tzOffset, 'GMT' };
      
         }
   
         /* -------------------------------------------------------------------------------------
         * Returns a date Collection of Start/End dates for US Daylight Saving Time
         * for the specified year.
         *
         * Based on code from: http://www.webexhibits.org/daylightsaving/b2.html
         * ------------------------------------------------------------------------------------- */
         public Date[] getDSTDates(Integer theYear) {
   
            Long thisYear;
            Long AprilDate;
            Long OctoberDate;
            Long MarchDate;
            Long NovemberDate;
            Long longSeven = 7;
            thisYear = Math.round(theYear);
      
            AprilDate = Math.mod(2+6 * thisYear - Math.floor(thisYear / 4).longValue(), longSeven) + 1;
            OctoberDate=  Math.mod(31-( Math.floor(thisYear * 5 / 4).longValue() + 1), longSeven);
      
            MarchDate = 14 - Math.mod(Math.floor(1 + thisYear * 5 / 4).LongValue(), longSeven);
            NovemberDate = 7 - Math.mod(Math.floor (1 + thisYear * 5 / 4).LongValue(), longSeven);
      
            string startDate = (thisYear > 2006 ? ('03/'+MarchDate) : ('04/'+AprilDate)) + '/' + thisYear;
            string endDate = (thisYear > 2006 ? ('11/'+NovemberDate):('10/'+OctoberDate))+ '/' + thisYear;
      
            Date[] rtnDates = new List<Date>();
            rtnDates.add(Date.parse(startDate));
            rtnDates.add(Date.parse(endDate));
            return rtnDates;
      
         }
   
         public Map<String, Integer[]> getTZSidKeys() {
   
            Map<String, Integer[]> tzSIDKeys = new Map<String, Integer[]>();
      
            tzSIDKeys.put('America/Adak', new Integer[]{-10, -9});
            tzSIDKeys.put('America/Anchorage', new Integer[]{-9, -8});
            tzSIDKeys.put('America/Chicago', new Integer[]{-6, -5});
            tzSIDKeys.put('America/Denver', new Integer[]{-7, -6});
            tzSIDKeys.put('America/Detroit', new Integer[]{-5, -4});
            tzSIDKeys.put('America/Halifax', new Integer[]{-4, -3});
            tzSIDKeys.put('America/Indianapolis', new Integer[]{-5, -4});
            tzSIDKeys.put('America/Los_Angeles', new Integer[]{-8, -7});
            tzSIDKeys.put('America/Montreal', new Integer[]{-5, -4});
            tzSIDKeys.put('America/New_York', new Integer[]{-5, -4});
            tzSIDKeys.put('America/Panama', new Integer[]{-5, -5});
            tzSIDKeys.put('America/Phoenix', new Integer[]{-7, -7});
            tzSIDKeys.put('America/Puerto_Rico', new Integer[]{-4, -4});
            tzSIDKeys.put('America/Toronto', new Integer[]{-5, -4});
            tzSIDKeys.put('America/Vancouver', new Integer[]{-8, -7});
            tzSIDKeys.put('Europe/London', new Integer[]{0, 1});
            tzSIDKeys.put('Pacific/Honolulu', new Integer[]{-10, -10});
            tzSIDKeys.put('Pacific/Pago_Pago', new Integer[]{-11, -11});
      
            return tzSIDKeys;
      
        }
   
    }

    /*
    * Get all the IDs out of an array into a set.
    * Really useful for bulkifying triggers
    * @author cpeterson
    */
    public static Set<id> getIds(sObject[] objList) {
        Set<id> retval = new Set<id>();
        for(sobject thisObj: objList){
            retval.add(thisObj.id);
        }
        return retval;
    }

    /*
    * Get a string field from an array of objects, and return those fields in an array.
    * @author cpeterson
    */ 
    public static List<string> getStringFields(List<sObject> objectList, string fieldName) {
        List<string> result = new List<string>();
        for(sObject thisObject:objectList){
            result.add(String.valueOf(thisObject.get(fieldName)));
        }       
        System.assertEquals(result.size(),objectList.size());
        return result;
    }
    
    /*
    * Wrapper around getStringFields, but returns an ID rather than a string
    * useful for use in SOQL queries.
    * @author cpeterson
    */
    public static List<Id> getIDFields(List<sObject> objectList, string fieldName) {
        List<Id> idList = Utils.getStringFields(objectList, fieldName);
        return idList;
    }
    
    /**
     * This method accepts the ID of any object type and returns the full name, including prefix of the sObject
     * type to which it belongs.
     * @author cpeterson
     **/
    public static Schema.SObjectType getObjectType(id subject){
        Schema.SObjectType result;
        string target = subject;
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        string keyPrefix;

        System.Debug('## >>> getObjectType() subject: ' + subject);
        System.Debug('## >>> getObjectType() gd: ' + gd);
        System.Debug('## >>> getObjectType() gd.values(): ' + gd.values());
        
        for(Schema.SObjectType describe: gd.values() ){
            keyPrefix = describe.getDescribe().getKeyPrefix();

            System.Debug('## >>> getObjectType() keyPrefix: ' + keyPrefix);
           
            if(keyPrefix != null && target.startsWith(keyPrefix)){
                result = describe;
                break; // no need to keep looking
            }
        }
        return result;
    }
    
    public static sObject getAllFields(id subject){
        Schema.SObjectType objectType = getObjectType(subject);
        Map<String, Schema.SObjectField> fields = objectType.getDescribe().fields.getMap();
        string queryString = 'SELECT ';
        for(Schema.sObjectField field:fields.values()){
            queryString += ' '+field.getDescribe().getName()+', ';
        }
        queryString = queryString.substring(0, queryString.length()-2)+' FROM '+objectType.getDescribe().getName()+' WHERE id = \''+subject+'\' LIMIT 1';
        sObject result = Database.query(queryString);
        return result;
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
    * SystemUtils
    */
    public static final String LINE_SEPARATOR = '\n';
    
    public static void debugLimits(){
        System.Debug(
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

}