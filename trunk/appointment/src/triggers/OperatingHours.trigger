trigger OperatingHours on Operating_Hours__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    System.Debug('## >>> Trigger START run by ' + UserInfo.getName());
    System.Debug('## >>> Trigger.isInsert ' + Trigger.isInsert);
    System.Debug('## >>> Trigger.isUpdate ' + Trigger.isUpdate);
    System.Debug('## >>> Trigger.isDelete ' + Trigger.isDelete);
    System.Debug('## >>> Trigger.isBefore ' + Trigger.isBefore);
    System.Debug('## >>> Trigger.isAfter ' + Trigger.isAfter);
    
    //if(Trigger.isInsert && Trigger.isBefore){
    //    OperatingHoursTrigger process = new OperatingHoursTrigger(Trigger.new, Trigger.old, OperatingHoursUtils.triggerAction.beforeInsert);
    //}
    //if(Trigger.isInsert && Trigger.isAfter){
    //    OperatingHoursTrigger process = new OperatingHoursTrigger(Trigger.new, Trigger.old, OperatingHoursUtils.triggerAction.afterInsert);
    //}
    //if(Trigger.isUpdate && Trigger.isBefore){
    //    OperatingHoursTrigger process = new OperatingHoursTrigger(Trigger.new, Trigger.old, OperatingHoursUtils.triggerAction.beforeUpdate);
    //}
    //if(Trigger.isUpdate && Trigger.isAfter){
    //    OperatingHoursTrigger process = new OperatingHoursTrigger(Trigger.new, Trigger.old, OperatingHoursUtils.triggerAction.afterUpdate);
    //}
    //if(Trigger.isDelete && Trigger.isBefore){
    //    OperatingHoursTrigger process = new OperatingHoursTrigger(Trigger.old, null, OperatingHoursUtils.triggerAction.beforeDelete);
    //}
    //if(Trigger.isDelete && Trigger.isAfter){
    //    OperatingHoursTrigger process = new OperatingHoursTrigger(Trigger.old, null, OperatingHoursUtils.triggerAction.afterDelete);
    //}

    // Limits.getDMLRows() and Limits.getDMLStatements() tell you how many rows you've touched and how many individual DML statements you've made. 
    // Compare these numbers with the absolute limits returned by Limits.getLimitDMLRows() and Limits.getLimitDMLStatements(), respectively. 

    // Report Governor Limit Stats and set return values
    //String limitText = 'Aggregate Queries: ' + Limits.getAggregateQueries() + '/' + Limits.getLimitAggregateQueries();
    //limitText += '\nSOQL Queries: ' + Limits.getQueries() +'/' + Limits.getLimitQueries();
    //limitText += '\nQuery Rows: ' + Limits.getQueryRows() +'/' + Limits.getLimitQueryRows();
    //limitText += '\nDML Rows: ' + Limits.getDMLRows() +'/' + Limits.getLimitDMLRows();
    //limitText += '\nDML Statements: ' + Limits.getDMLStatements() +'/' + Limits.getLimitDMLStatements();
    //System.debug(limitText);        
    //System.Debug('## >>> Governor Limit Stats ' + limitText);
    //Utils.debugLimits(); // apex-lang project
    System.Debug('## >>> Trigger END <<<');

}