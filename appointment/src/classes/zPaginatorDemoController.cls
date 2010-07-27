global class zPaginatorDemoController {
/*
    public List<AccountWrapper> accounts {get;set;}
    public SObjectPaginator acctPaginator{get;set;}
    public Account selectedAccount{get;set;}
    public List<ContactWrapper> contacts {get;set;}
    public SObjectPaginator contPaginator{get;set;}
    public Contact selectedContact{get;set;}
    
    public zPaginatorDemoController(){
        this.accounts = new List<AccountWrapper>();
        this.contacts = new List<ContactWrapper>();
        this.acctPaginator = new SObjectPaginator(5,new AccountListListener(this));
        this.contPaginator = new SObjectPaginator(5,new ContactListListener(this));
        this.acctPaginator.setRecords([select id,name from account]);
    }
    
    global void handleAccountListPageChange(List<SObject> newPage){
        this.accounts.clear();
        if(newPage != null && newPage.size() > 0){
            for(Integer i = 0; i < newpage.size(); i++){
                AccountWrapper acct = new AccountWrapper((Account)newPage.get(i));
                accounts.add(acct);
                acct.serialNumber = i + acctPaginator.pageStartPosition;
            }
            PageUtils.param('accountId',accounts.get(0).obj.id);
            handleAccountSelected();
        }
    }
    
    public PageReference handleAccountSelected(){
        String accountId = PageUtils.param('accountId');
        for(AccountWrapper acct : accounts){
            acct.selected = acct.obj.id == accountId;
            if(acct.selected){
                selectedAccount = acct.obj;
                this.contPaginator.setRecords([select id,name from contact where accountid = :acct.obj.id]);
            }
        }
        return null;
    }
    
    global void handleContactListPageChange(List<SObject> newPage){
        System.debug('new contact list page: ' + ArrayUtils.toString(newPage));
        this.contacts.clear();
        if(newPage != null && newPage.size() > 0){
            for(Integer i = 0; i < newpage.size(); i++){
                ContactWrapper cntct = new ContactWrapper((Contact)newPage.get(i));
                contacts.add(cntct);
                cntct.serialNumber = i + (contPaginator == null ? 0 : contPaginator.pageStartPosition);
            }
            Contact wrapper = (Contact)this.contacts.get(0).obj;
            if(wrapper != null){
                PageUtils.param('contactId',wrapper.id);
                handleContactSelected();
            }
        }
    }
    
    public PageReference handleContactSelected(){
        String contactId = PageUtils.param('contactId');
        for(ContactWrapper contact : contacts){
            contact.selected = contact.obj.id == contactId;
            if(contact.selected){
                selectedContact = contact.obj;
            }
        }
        return null;
    }

    global class AccountListListener implements SObjectPaginatorListener {
        private zPaginatorDemoController controller;
        global AccountListListener(zPaginatorDemoController controller){
            this.controller = controller;
        }
        global void handlePageChange(List<SObject> newPage){
            controller.handleAccountListPageChange(newPage);
        }
    }
    
    global class ContactListListener implements SObjectPaginatorListener {
        private zPaginatorDemoController controller;
        global ContactListListener(zPaginatorDemoController controller){
            this.controller = controller;
        }
        global void handlePageChange(List<SObject> newPage){
            controller.handleContactListPageChange(newPage);
        }
    }

    public class AccountWrapper{
        public Account obj{get;set;}
        public Integer serialNumber{get;set;}
        public Boolean selected{get;set;}
        public AccountWrapper(Account obj){
            this.obj = obj;
        }
    }

    public class ContactWrapper{
        public Contact obj{get;set;}
        public Integer serialNumber{get;set;}
        public Boolean selected{get;set;}
        public ContactWrapper(Contact obj){
            this.obj = obj;
        }
    }
*/
}