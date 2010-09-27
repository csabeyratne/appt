public class zOpportunityPagination{
     
    public ApexPages.StandardSetController Con{
        get {
            if(con== null) {
                con= new ApexPages.StandardSetController(Database.getQueryLocator([select name,closedate from Opportunity]));
            }
            con.setPageSize(5);
            return con;
        }
        set;
    }
     
    public List<opportunity> getOpportunities() {
         return (List<opportunity>) con.getRecords();
    }
     
     /*** Pagination control***/
     
     // indicates whether there are more records after the current page set.
    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
  
    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }
  
    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
  
    // returns the first page of records
    public void first() {
        con.first();
    }
  
    // returns the last page of records
    public void last() {
        con.last();
    }
  
    // returns the previous page of records
    public void previous() {
        con.previous();
    }
  
    // returns the next page of records
    public void next() {
        con.next();
    }
  
    // returns the PageReference of the original page, if known, or the home page.
    public void cancel() {
        con.cancel();
    }
     
    //   
   
 /*** Pagination control***/
}