global with sharing class CalendarController {
    public Boolean showMessage     {get; set;}
    public  String Notification    {get; set;}
    public  string searchName      {get; set; } { searchName = ''; } 
    public  CalendarController     getResource() { return this; }
    public  list<W2CPerson>        W2CPeople;
    private Map<String, Integer>   groupNamesMap;
    private DisplayEvents[] lesevents;

    public CalendarController(ApexPages.StandardController con){
      String w = System.currentPageReference().getParameters().get('w');
      String wid = System.currentPageReference().getParameters().get('wId');
      String obName = getObjectName(w, wid);
      setupNotification(w, obName);
    }

/*--------------------TEST-------------------------*/
   public static testMethod void testConstructor(){
      CalTestingUtil tu = new CalTestingUtil();
      Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
      CalendarController cc = new CalendarController(sc);
      System.assert(cc!=null);
      cc.getResource();
    }
/*----------------------------------------------------*/


    
    
  global class DisplayEvents {
      public String eventName       {get; set;}
      public String description     {get; set;}
      public Boolean allday         {get; set;}
      public String eventId         {get; set;}
      public String startDate       {get; set;}
      public String endDate         {get; set;}
      public Integer groupNum       {get; set;}
      public String personId        {get; set;}
      public String personName      {get; set;}
      private Map<String, Integer> groupNamesMap;
      
      public DisplayEvents(Event evt, Group__c rsc, Map<String, Integer> gnm) {
        eventName=evt.Event_Name__c;
        description = escapeNewLine(evt.Description);
        allday= false;
        eventId = evt.Id; 
        startDate = evt.StartDateTime.year()+'-'+evt.StartDateTime.month()+'-'+evt.StartDateTime.day()+' '+
                    evt.StartDateTime.hour()+':'+evt.StartDateTime.minute()+':'+evt.StartDateTime.second();
        endDate = evt.EndDateTime.year()+'-'+evt.EndDateTime.month()+'-'+evt.EndDateTime.day()+' '+
                    evt.EndDateTime.hour()+':'+evt.EndDateTime.minute()+':'+evt.EndDateTime.second();                
        
        groupNum = gnm.get(rsc.Resource_Type__c);
          
        personId = evt.ResourceId__c;
        personName = rsc.Name;
       }            

       public DisplayEvents(Event evt, Group__c rsc, CalendarController cc) {
        eventName=evt.Event_Name__c;
        description = escapeNewLine(evt.Description);
        allday= false;
        eventId = evt.Id; 
        startDate = evt.StartDateTime.year()+'-'+evt.StartDateTime.month()+'-'+evt.StartDateTime.day()+' '+
                    evt.StartDateTime.hour()+':'+evt.StartDateTime.minute()+':'+evt.StartDateTime.second();
        endDate = evt.EndDateTime.year()+'-'+evt.EndDateTime.month()+'-'+evt.EndDateTime.day()+' '+
                    evt.EndDateTime.hour()+':'+evt.EndDateTime.minute()+':'+evt.EndDateTime.second();
        groupNum = cc.groupNamesMap.get(rsc.Resource_Type__c);    
        personId = evt.ResourceId__c;
        personName = rsc.Name;
       }       
     
     public List<String> toArray(){
        List <String> returnVal = new String[9];
        returnVal.set(0,eventName);
        returnVal.set(1, description);
        returnVal.set(2,'false');
        returnVal.set(3,eventId);
        returnVal.set(4,startDate);
        returnVal.set(5,endDate);
        returnVal.set(6,groupNum.format());
        returnVal.set(7, personId);
        returnVal.set(8, personName);
        return returnVal;
     }
     
     private String escapeNewLine(String s){
      if(s == null)
        return null;
      else{
        String returnVal = s.replaceAll('\n|\r', '%%!!');
        returnVal = returnVal.replaceAll('(%%!!)+', ', ');
        return returnVal;     
      }
    }

   }//closing of subclass/innerClass 
  
  //This method is not currently used, but may be useful to other developers
/*     // returns a list of events
   public DisplayEvents[] getEvents() {
     Group__c rsc;
     if (lesevents == null) {
      lesevents = new DisplayEvents[]{};
      for (Event evt : [SELECT Id, Event_Name__c, isAllDayEvent, Description, 
                           StartDateTime, EndDateTime, Subject, ResourceId__c,
                           StartDateTimeBackup__c, EndDateTimeBackup__c
                        FROM Event 
                        where Work_Shift_Event__c = true]) {
          rsc =  [select Id,Name, Description__c, Resource_Type__c 
                                     from Group__c 
                                     where Id =:evt.ResourceId__c];
         lesevents.add(new DisplayEvents(evt, rsc, this));
       }
     }
     return lesevents;      
  } 
*/
/*--------------------TEST--------------------------*/     
/*  private static TestMethod void testGetEvents() { 
        CalTestingUtil tu = new CalTestingUtil();
              Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
        CalendarController cc = new CalendarController(sc);  
        cc.setupGroupNamesMap();    
        DisplayEvents[] de = cc.getEvents();
        System.assert(de!=null);
  }*/
/*----------------------------------------------------*/


  Webservice static List<List <String>> getAllEvents(String startT, String endT) {
    Datetime sd = datetime.valueOf(dateFix(startT));
    Datetime ed = datetime.valueOf(dateFix(endT));
    List<String> eToA;
    Group__c rsc;
    Map <String, Integer> StaticGroupNamesMap = getStaticGroupNamesMap(); 
    List <List <String>> returnEvents = new List<List <String>>();
    List <Event> eventsFromDB = [SELECT Id, Event_Name__c, isAllDayEvent, Description, 
                           StartDateTime, EndDateTime, Subject, ResourceId__c,
                           StartDateTimeBackup__c, EndDateTimeBackup__c
                        FROM Event 
                        where (Work_Shift_Event__c = true and StartDateTime >= :sd and StartDateTime <=:ed)
                        or (Work_Shift_Event__c = true and EndDateTime >= :sd and EndDateTime <=:ed)
                        or (Work_Shift_Event__c = true and StartDateTime < :sd and EndDateTime >= :ed) ];  
    for (Event evt : eventsFromDB) {
      rsc =  [select Id,Name, Description__c, Resource_Type__c 
                                     from Group__c 
                                     where Id =:evt.ResourceId__c];
          eToA = new DisplayEvents(evt, rsc, StaticGroupNamesMap).toArray();
          returnEvents.add(eToA);
     }     
    return returnEvents;
  }  

/*--------------------TEST--------------------------*/    
    private static TestMethod void testGetAllEvents() {
        CalTestingUtil tu = new CalTestingUtil();
        List<List<String>> evts = CalendarController.getAllEvents('2010-4-6 00:00:00', '2010-4-8 00:00:00');
        Integer i, j;
        for (i=0; i < evts.size(); i++){
            List<String> theStrings = evts.get(i);
            for (j=0; j<theStrings.size(); j++){
                if (j!=1) // object it is associated with. Will be null if not associated
                    System.assert(theStrings.get(j)!=null);
            }
        }
  }
/*----------------------------------------------------*/

    Webservice static String getGroupObject(String curPage) {
        PageReference pr = new PageReference(curPage);
        String url = pr.getUrl();
        
        Map<String, String> param = pr.getParameters();
        return curPage;
    }
  
  Webservice static String createEvent(String name ,String resourceId, String strtDate, String strtTime, String endDate, String endTime, String newEventDesc, String curPage){ 
    //******** name = userId **************************/
    // setup resources
    User u = [Select Name, Id from User where Id =:name];
    Group__c g = [Select Name, Id, Resource_Type__c from Group__c where Id =:resourceId];
    Event evt = new Event();
    
    PageReference pr = new PageReference(curPage);
    String WOWId = pr.getParameters().get('wId');
    String WOWType = pr.getParameters().get('w');

    evt.Subject = 'Scheduled Resource: '+g.Name;
    evt.Event_Name__c = u.Name;
    evt.Description = newEventDesc;   
    evt.Work_Shift_Event__c = true;
    evt.OwnerId = name;
    evt.ResourceId__c = resourceId;
    datetime thedate = getCorrectDatetime(strtDate, strtTime);
    evt.StartDateTime = thedate;
    thedate = getCorrectDatetime(endDate,endTime);
    evt.EndDateTime = thedate;
    evt.StartDateTimeBackup__c = getCorrectDatetime(strtDate,'12:00 PM');
    evt.EndDateTimeBackup__c = getCorrectDatetime(endDate,'1:00 PM'); 
   
    if(WOWType=='case')
      evt.WhatId = WOWId;
    else if(WOWType=='account')
      evt.WhatId = WOWId;
    else if(WOWType=='asset')
      evt.WhatId=WOWId;
    else if(WOWType=='campaign')
      evt.WhatId=WOWId;
    else if(WOWType=='opportunity')
      evt.WhatId=WOWId;
    else if(WOWType=='solution')
      evt.WhatId=WOWId;
    else if(WOWType=='contact')
      evt.WhoId=WOWId;
    else if(WOWType=='lead')
      evt.WhoId=WOWId;
    else
      {}      
    if(checkTimeOverlap(evt.StartDateTime, evt.EndDateTime, evt.ResourceId__c, null))
      return '1';
    try{ 
      insert evt;
      return evt.Id; 
    }catch(exception e){
        return '0';
    }
  }
  
  Private static Datetime getCorrectDatetime(String sdate, String stime){
    //get correct hour
    String hour = stime.substring(0, stime.indexOf(':'));
    Integer iHour = Integer.valueOf(hour);
    if(stime.contains('PM'))
      iHour = iHour + 12;
    //get minutes
    String min = stime.substring(stime.indexOf(':')+1, stime.indexOf(' '));
    Integer iMin = Integer.valueOf(min);
    //seconds
    Integer iSec = 0;
    //Date in an array mdy = Month, Day, Year
    List <String> mdy = sdate.split('/');
    Integer iMonth = Integer.valueOf(mdy[0]);
    Integer iDay = Integer.valueOf(mdy[1]);
    Integer iYear = Integer.valueOf(mdy[2]);
    return datetime.newInstance(iYear, iMonth, iDay, iHour, iMin, iSec);
  } 
    
  Webservice static Boolean updateEvent(String eventId, String newStartDate, String newEndDate){
    Event evt;
    try{ 
      evt = [select StartDateTime, EndDateTime, id, Subject, ResourceId__c from Event where Id =:eventId];
    } catch (Exception e){
      return false;
    } 
    String sd = dateFix(newStartDate);
    String ed = dateFix(newEndDate);
    
    Boolean overlapCheck=checkTimeOverlap(datetime.valueOf(sd), datetime.valueOf(ed), evt.ResourceId__c, evt.Id);
    if( overlapCheck == true)
      return false;
    
    evt.StartDateTime = datetime.valueOf(sd);
    evt.EndDateTime = datetime.valueOf(ed);
    
    try{
      update evt;
      return true;
    }
    catch(Exception e){
      return false;
    }
  }

/*--------------------TEST--------------------------*/    
  private static TestMethod void testUpdateEvents(){
    CalTestingUtil tu = new CalTestingUtil();
    datetime dt = datetime.now();
    datetime et = datetime.now().addHours(2);
    String dts = dt.year()+'-'+dt.month()+'-'+dt.day();
    String ets = et.year()+'-'+et.month()+'-'+et.day();
    Boolean update1 = CalendarController.updateEvent(tu.testEventId, '2010-04-10 12:00:00', '2010-04-10 15:00:00');
    Boolean update2 = CalendarController.updateEvent(tu.testEventId, dts+' 07:45:00', ets+' 08:30:00');
  }
/*----------------------------------------------------*/


  
  Webservice static Boolean editEvent(String eventId, String eventName, String description) {
    Event evt = [select Description, Event_Name__c, Subject, isAllDayEvent,StartDateTime, EndDateTime, 
                StartDateTimeBackup__c, EndDateTimeBackup__c, Id from Event where Id =:eventId];  
    
    //evt.Event_Name__c = eventName;
    evt.Description = description;
       
    update evt;
    return true;
  }

/*--------------------TEST--------------------------*/   
  private static TestMethod void testEditEvent(){
          Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
    CalendarController cc = new CalendarController(sc);
    CalTestingUtil tu = new CalTestingUtil();
    CalendarController.editEvent(tu.testEventId, 'newName', 'newDescription');      
  }
/*----------------------------------------------------*/

  
  Webservice static Boolean deleteEvent(String eventId){
   Event evt = [select id from Event where Id=:eventId];
   delete evt;
   return true; 
  }

/*--------------------TEST--------------------------*/    
  private static TestMethod void testDeleteEvents(){
          Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
    CalendarController cc = new CalendarController(sc);
    CalTestingUtil tu = new CalTestingUtil();
    CalendarController.deleteEvent(tu.testEventId);
  }
/*----------------------------------------------------*/  

  public Class W2CPerson{
    public String userId          {get; set;}
    public String firstName   {get; set;}
    public String lastName    {get; set;}
    
    public W2CPerson(String id, String fn, String ln){
      userId = id;
      firstName = fn;
      lastName = ln;
    }
  }

    public list<W2CPerson> getW2CPeople(){
       if(W2CPeople == null){
         //list <User> people = [Select Id, FirstName, LastName from User where isActive = true order by  LastName];
         W2CPeople = new list <W2CPerson>();
         //for (User p : people){
         W2CPeople.add(new W2CPerson(Userinfo.getUserId(), Userinfo.getFirstName(), Userinfo.getLastName()));
          //}
       }
      return W2CPeople;
    }

/*--------------------TEST--------------------------*/      
    private static TestMethod void testGetW2CPeople() {
      CalTestingUtil tu = new CalTestingUtil();
            Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
      CalendarController cc = new CalendarController(sc);
      List<W2CPerson> thePeople = cc.getW2CPeople();
      Integer i;
      for (i=0;i<thePeople.size(); i++) {
        System.assert(thePeople[i].userId!=null);
      }
    }
/*----------------------------------------------------*/


   /* Return list of names of the groups */
    public List<String> getBigGroups() {
         DescribeSObjectResult descSObjectRslt;
         List<String> entries = new List<String>();
         Schema.DescribeFieldResult R =  Group__c.Resource_Type__c.getDescribe();
         List<Schema.PicklistEntry> P = R.getPicklistValues();

         for (PicklistEntry picklistValue : P) {
          entries.add(picklistValue.getValue());
         }
     return entries;
  }

/*--------------------TEST--------------------------*/      
    private static TestMethod void testGetBigGroups() {
        CalTestingUtil tu = new CalTestingUtil();
              Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
        CalendarController cc = new CalendarController(sc); 
        List<String> bg = cc.getBigGroups();
        System.assert(bg!=null);
    }
/*----------------------------------------------------*/
  
  Webservice static List<String> groupsNames() {
     DescribeSObjectResult descSObjectRslt;
     List<String> entries = new List<String>();
     Schema.DescribeFieldResult R =  Group__c.Resource_Type__c.getDescribe();
     List<Schema.PicklistEntry> P = R.getPicklistValues();
     for(Schema.Picklistentry ple : P){
      entries.add(ple.getLabel());
     }
     return entries;
    }

/*--------------------TEST--------------------------*/      
    private static TestMethod void testGroupsNames() {
        CalTestingUtil tu = new CalTestingUtil();
        List<String> gn = CalendarController.groupsNames();
        System.assert(gn!=null);    
    }
/*----------------------------------------------------*/


  public class subgroup{
      public String   name            {get; set;}
      public String   description     {get; set;}
      public Integer  groupNum        {get; set;}
      public String   Id              {get; set;}
      public String   startDate       {get; set;}
      public String   endDate         {get; set;}
    
      public subgroup(Group__c g, Integer gNum){
          name        = g.Name;
          Id          = g.Id;
          groupNum    = gNum;
          description = escapeNewLine(g.Description__c);
          startDate   = '0000-00-00 00:00:00';
          endDate     = '0000-00-00 00:00:00';
    }
    
    private String escapeNewLine(String s){
      if(s == null)
        return null;
      else{
        String returnVal = s.replaceAll('\n|\r', '%%!!');
        returnVal = returnVal.replaceAll('(%%!!)+', ', ');
        return returnVal;     
      }
    }
  }
  
  public List<subgroup> getSubgroups(){
    setupGroupNamesMap();
    List <Group__c> groups = [select Name, Resource_Type__c,  Description__c, Id from Group__c where IsDeleted = false ORDER by Name];
    List<subgroup> returnVal = new List<subgroup>();  
    for(Group__c g : groups){
      subgroup sg = new subgroup(g, groupNamesMap.get(g.Resource_Type__c) );
      returnVal.add(sg);
    }
    return returnVal;
  }

/*--------------------TEST--------------------------*/   
    private static TestMethod void testGetSubgroups() {
        CalTestingUtil tu = new CalTestingUtil();
              Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
        CalendarController cc = new CalendarController(sc); 
        List<subgroup> sb = cc.getSubgroups();
        System.assert(sb!=null);    
    }
/*----------------------------------------------------*/

    
   public void setupNotification(String w, String obName){
      if(w==null){
        Notification = 'Newly created events are not associated with any objects. ';
        showMessage = false;
      }
      else{
        Notification='Newly created events will be associated with the '+w+': '+obName;        
            showMessage = true;
      }
    }  

/*--------------------TEST--------------------------*/   
   public static testMethod void testsetupNotification(){
      CalTestingUtil tu = new CalTestingUtil();
            Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
      CalendarController cc = new CalendarController(sc);
      cc.setupNotification(null, null);
      System.assertEquals(cc.Notification, 'Newly created events are not associated with any objects. ');
      cc.setupNotification('test', 'test');
      System.assertEquals(cc.Notification, 'Newly created events will be associated with the test: test');
    }
/*----------------------------------------------------*/


    public void setupGroupNamesMap(){
      if(this.groupNamesMap == null){
       Schema.DescribeFieldResult R =  Group__c.Resource_Type__c.getDescribe();
       List<Schema.PicklistEntry> P = R.getPicklistValues();
       groupNamesMap = new Map<String, Integer>();
       Integer i;
       for(i=0;i<P.size();i++){
         groupNamesMap.put(P[i].getLabel(), i);
       }
      } 
    }

/*--------------------TEST--------------------------*/      
    private static TestMethod void testSetupGroupNamesMap(){
      CalTestingUtil tu = new CalTestingUtil();
            Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
      CalendarController cc = new CalendarController(sc);
      cc.setupGroupNamesMap();
      System.assert(cc.groupNamesMap != null);
    }
/*----------------------------------------------------*/

        
    private String getObjectName(String w, String wId){
      if(w=='case')
        return [select Subject, Id from Case where id = :wId].Subject;
      else if(w=='account')
        return [select Name, Id from Account where id = :wId].Name;
      else if(w=='asset')
        return [select Name, Id from Asset where id = :wId].Name;
      else if(w=='campaign')
        return [select Name, Id from Campaign where id = :wId].Name;
      else if(w=='opportunity')
        return [select Name, Id from Opportunity where id = :wId].Name;
      else if(w=='solution')
        return [select SolutionName, Id from Solution where id = :wId].SolutionName;
      else if(w=='contact')
        return [select Name, Id from Contact where id = :wId].Name;
      else if(w=='lead')
        return [select Name, Id from Lead where id = :wId].Name;
      else
        return 'unknown';
    }

/*--------------------TEST--------------------------*/      
    public static testMethod void testGetObjectName(){
      CalTestingUtil ct = new CalTestingUtil();
            Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
      CalendarController cc = new CalendarController(sc);
      cc.getObjectName('case', ct.caseId);
      cc.getObjectName('account', ct.accountId);
      cc.getObjectName('asset', ct.assetId);
      cc.getObjectName('campaign', ct.campaignId);
      cc.getObjectName('opportunity', ct.opportunityId);      
      cc.getObjectName('solution', ct.solutionId);      
      cc.getObjectName('contact', ct.contactId); 
      cc.getObjectName('lead', ct.leadId);
      cc.getObjectName('blah', ct.opportunityId);      
    }
/*----------------------------------------------------*/
    

  private static Map<String, Integer> getStaticGroupNamesMap(){
    Map <String, Integer> returnVal = new Map<String, Integer>();
    Schema.DescribeFieldResult R =  Group__c.Resource_Type__c.getDescribe();
    List<Schema.PicklistEntry> P = R.getPicklistValues();
    Integer i;
    for(i=0;i<P.size();i++){
     returnVal.put(P[i].getLabel(), i);
    }
   return returnVal;
  }

/*--------------------TEST--------------------------*/    
  private static TestMethod void testGetStaticGroupNamesMap(){
    Map<String, Integer> gn = CalendarController.getStaticGroupNamesMap();
    gn.put('tester', 15);
    System.assert(!gn.isEmpty());
  }
/*----------------------------------------------------*/

    public String getfullUserId(){
      return System.Userinfo.getUserId();
    }

/*--------------------TEST--------------------------*/  
    private static TestMethod void testGetfullUserId() {
        CalTestingUtil tu = new CalTestingUtil();
              Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
        CalendarController cc = new CalendarController(sc);
        String userID = cc.getfullUserId(); 
        System.assert(userID!=null);
    }
/*----------------------------------------------------*/

  private static String dateFix(String newDate){
    String returnVal = newDate.replace('T', ' ');
    if(returnVal.length()>19)
     returnVal = returnVal.substring(0, (returnVal.length()-6));
    return returnVal;
  }

/*--------------------TEST--------------------------*/    
  private static TestMethod void testdateFix(){
    String testString = '2010-04-08T11:00-07:00';
    String returnVal = CalendarController.dateFix(testString);
    System.assertEquals('2010-04-08 11:00', returnVal);
  }
/*----------------------------------------------------*/

  Webservice static String getUserName(String userId){
    User u = [Select Name, Id from User where Id = :userId];
    return u.Name;  
  }

/*--------------------TEST--------------------------*/  
  private static TestMethod void testGetUserName(){
        CalTestingUtil tu = new CalTestingUtil();
              Group__c res;
      if (res == null) {
        res = new Group__c(); 
      }
      ApexPages.StandardController sc = new ApexPages.StandardController(res);
        CalendarController cc = new CalendarController(sc);
        String userID = cc.getfullUserId();
        String userName = CalendarController.getUserName(userID);
        System.assert(userName!=null);
  }
/*----------------------------------------------------*/

  private static Boolean checkTimeOverlap(DateTime startDT, DateTime endDT, String ResId, String eventId){
    List <Event> events= [Select StartDateTime, EndDateTime, Id from Event where ResourceId__c = :ResId and Work_Shift_Event__c = true];
    Long s1 = startDT.getTime();
    Long e1 = endDT.getTime();
    Long s2;
    Long e2;
    for(Event e : events){
        if(e.Id != eventId){
            s2 = e.StartDateTime.getTime();
            e2 = e.EndDateTime.getTime();
            if(s1<s2 && e1>s2 &&e2>e1)
             return true;
            if(s1<=s2 && e2<=e1)
             return true;
            if(s2<=s1 && e1<=e2)
             return true;
            if(s2<s1 && s1<e2 && e2<e1)
             return true;
        }       
    }   
    return false;
  }    

/*--------------------TEST--------------------------*/    
   private static TestMethod void testCheckTimeOverlap() {
    CalTestingUtil ct = new  CalTestingUtil();
    Date d = Date.today();
    System.assertEquals('1', CalendarController.createEvent(Userinfo.getUserId(), ct.resourceId, d.format(), '7:15 AM', d.format(), '8:30 AM', 'new test', '/apex/basicCalendar'));
    System.assertEquals('1', CalendarController.createEvent(Userinfo.getUserId(), ct.resourceId, d.format(), '7:15 AM', d.format(), '7:30 AM', 'new test', '/apex/basicCalendar'));
    System.assertEquals('1', CalendarController.createEvent(Userinfo.getUserId(), ct.resourceId, d.format(), '6:15 AM', d.format(), '8:30 AM', 'new test', '/apex/basicCalendar'));  
    System.assertEquals('1', CalendarController.createEvent(Userinfo.getUserId(), ct.resourceId, d.format(), '6:15 AM', d.format(), '7:30 AM', 'new test', '/apex/basicCalendar'));  
  }
/*----------------------------------------------------*/


}