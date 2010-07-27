trigger Appointment on Appointment__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    System.Debug('## >>> Trigger START run by ' + UserInfo.getName());
    System.Debug('## >>> Trigger.isInsert ' + Trigger.isInsert);
    System.Debug('## >>> Trigger.isUpdate ' + Trigger.isUpdate);
    System.Debug('## >>> Trigger.isDelete ' + Trigger.isDelete);
    System.Debug('## >>> Trigger.isBefore ' + Trigger.isBefore);
    System.Debug('## >>> Trigger.isAfter ' + Trigger.isAfter);
    
    //if(Trigger.isInsert && Trigger.isBefore){
    //    AppointmentTrigger process = new AppointmentTrigger(Trigger.new, Trigger.old, AppointmentUtils.triggerAction.beforeInsert);
    //}
    //if(Trigger.isInsert && Trigger.isAfter){
    //    AppointmentTrigger process = new AppointmentTrigger(Trigger.new, Trigger.old, AppointmentUtils.triggerAction.afterInsert);
    //}
    //if(Trigger.isUpdate && Trigger.isBefore){
    //    AppointmentTrigger process = new AppointmentTrigger(Trigger.new, Trigger.old, AppointmentUtils.triggerAction.beforeUpdate);
    //}
    //if(Trigger.isUpdate && Trigger.isAfter){
    //    AppointmentTrigger process = new AppointmentTrigger(Trigger.new, Trigger.old, AppointmentUtils.triggerAction.afterUpdate);
    //}
    //if(Trigger.isDelete && Trigger.isBefore){
    //    AppointmentTrigger process = new AppointmentTrigger(Trigger.old, null, AppointmentUtils.triggerAction.beforeDelete);
    //}
    //if(Trigger.isDelete && Trigger.isAfter){
    //    AppointmentTrigger process = new AppointmentTrigger(Trigger.old, null, AppointmentUtils.triggerAction.afterDelete);
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