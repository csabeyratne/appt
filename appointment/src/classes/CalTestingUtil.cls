public with sharing class CalTestingUtil {
  
  public String resourceId    {get; set;}
  public String accountId     {get; set;}
  public String leadId        {get; set;}
  public String assetId       {get; set;}
  public String campaignId    {get; set;}
  public String caseId        {get; set;}
  public String opportunityId {get; set;}
  public String solutionId    {get; set;}
  public String contactId     {get; set;}
  public String testEventId   {get; set;}
  
  public CalTestingUtil(){
    makeResource();
    makeAccount();
    makeAsset();
    makeCampaign();
    makeCase();
    makeOpportunity();
    makeSolution();
    makeLead();
    makeContact();
    
    makeEvents();
  }
  
  private static testmethod void testConstructor(){
    CalTestingUtil ctu = new CalTestingUtil();
  }
  
  private void makeContact(){
    Contact c = new Contact();
    c.FirstName = 'test';
    c.LastName= 'test';
    c.Email = 'test@test.com';
    insert c;
    contactId = c.Id;
  }
  
  private void makeSolution(){
    Solution s = new Solution();
    s.SolutionName = 'test';
    insert s;
    solutionId = s.Id;
  }
  
  private void makeOpportunity(){
    Opportunity o = new Opportunity();
    o.Name='test';
    o.CloseDate = Date.today();
    o.StageName='test';
    insert o;
    opportunityId = o.Id;
  }
  
  
  private void makeCase(){
    Case c = new Case();
    c.Status='test';
    c.Origin = 'test';
    insert c;
    caseId = c.Id;
  }
  
  private void makeCampaign(){
    Campaign c = new Campaign();
    c.Name = 'test';
    insert c;
    campaignId = c.Id;
  }
  
  private void makeAsset(){
    Asset a = new Asset();
    a.Name = 'test';
    a.AccountId = accountId;
    insert a;
    assetId = a.Id;
    
  }
  private void makeAccount(){
    Account a = new Account();
    a.Name = 'test tester';
    insert a;
    accountId = a.Id;
  }
 
  private void makeLead(){
    Lead l = new Lead();
    l.LastName = 'tester';
    l.Company ='testingIsAwesome inc';
    insert l;
    leadId = l.Id;
  }
  
  private void makeResource(){
    Group__c g = new Group__c();
    g.Name='test';
    g.Resource_Type__c='test';
    g.Description__c = 'this is a test';
    insert g;
    resourceId = g.Id;
  }
  
  private void makeEvents(){
    datetime dt = datetime.now();
    datetime et = datetime.now().addHours(2);
    Pagereference pr = new Pagereference('/apex/basicCalendar');
    testEventId = CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '7:00 AM', et.Date().format(), '8:00 AM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+accountId+'&w=account');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '8:15 AM', et.Date().format(), '9:00 AM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+leadId+'&w=lead');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '9:15 AM', et.Date().format(), '10:00 AM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+leadId+'&w=lead');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '10:15 AM', et.Date().format(), '11:00 AM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+assetId+'&w=asset');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '11:15 AM', et.Date().format(), '12:00 PM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+campaignId+'&w=campaign');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '12:15 PM', et.Date().format(), '1:00 PM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+caseId+'&w=case');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '1:15 PM', et.Date().format(), '2:00 PM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+opportunityId+'&w=opportunity');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '2:15 PM', et.Date().format(), '3:00 PM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+solutionId+'&w=solution');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '3:15 PM', et.Date().format(), '4:00 PM', 'new test', pr.getUrl());
    pr = new Pagereference('/apex/basicCalendar?wId='+contactId+'&w=contact');
    CalendarController.createEvent(Userinfo.getUserId(), resourceId, dt.Date().format(), '4:15 PM', et.Date().format(), '5:00 PM', 'new test', pr.getUrl());
  }
}