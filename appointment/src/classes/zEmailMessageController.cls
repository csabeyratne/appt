public with sharing class zEmailMessageController {
   public String EmailMessage { get; set; }
   private List<EmailMessage> messages;
   private String sortDirection = 'ASC';
   private String sortExp = 'MessageDate';
   public String wheretext;

   public zEmailMessageController(){
    wheretext = '';
   }

   public String sortExpression { get {
        return sortExp;
     }
     set {
       //if the column is clicked on then switch between Ascending and Descending modes
       if (value == sortExp)
         sortDirection = (sortDirection == 'ASC')? 'DESC' : 'ASC';
       else
         sortDirection = 'ASC';
       sortExp = value;
     }
   }
   
public void setWhereText(String value) {  
   whereText = value;
 }
public string getWhereText(){
    return wheretext;
}
   
public List<SelectOption> getViews(){
    List<SelectOption> options = new List<SelectOption>();
    options.add(new SelectOption('WHERE e.id != null','All'));
    options.add(new SelectOption('WHERE e.Incoming = true AND e.Status = \'0\' ','Incoming Unread'));
    options.add(new SelectOption('WHERE e.Incoming = true AND e.Status = \'1\' ','Incoming Read'));
        options.add(new SelectOption('WHERE e.Incoming = true','All Incoming'));
        options.add(new SelectOption('WHERE e.Incoming = false','All Outgoing'));
        options.add(new SelectOption('WHERE e.ToAddress = \'support@x2od.com\'','Support Queue'));
        options.add(new SelectOption('WHERE e.ToAddress = \'support2@x2od.com\'','Support Queue2')); //etc.
        return options;
}

 public String getSortDirection() {
    //if not column is selected 
    if (sortExpression == null || sortExpression == '')
      return 'ASC';
    else
     return sortDirection;
 }

 public void setSortDirection(String value) {  
   sortDirection = value;
 }
  
   public List<EmailMessage> getMessages() {
       return messages;
   }
   
   public PageReference ViewData() {
       //build the full sort expression
       string sortFullExp = sortExpression  + ' ' + sortDirection;
      
       //query the database based on the sort expression
       messages = Database.query('Select e.FromAddress, e.Parent.ContactId, e.Parent.Contact.Name, e.Parent.Account.Name, e.ToAddress, e.Parent.CaseNumber, e.Parent.AccountId, e.TextBody, e.SystemModstamp, e.Subject, e.Status, e.ParentId, e.MessageDate, e.LastModifiedDate, e.LastModifiedById, e.IsDeleted, e.Incoming, e.Id, e.HtmlBody, e.Headers, e.HasAttachment, e.FromName, e.CreatedDate, e.CreatedById, e.CcAddress, e.BccAddress, e.ActivityId From EmailMessage e ' + wheretext + ' order by ' + sortFullExp + ' limit 1000');
       return null;
   }
}