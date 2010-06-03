public class repeatCon {

  public void next() { 
    addMonth(1);
  }

  public void prev() { 
    addMonth(-1); 
  }

  public repeatCon() {
 
   Date d = system.today();  // default to today 
   Integer mo = d.month(); 
   String m_param = System.currentPageReference().getParameters().get('mo');
   String y_param = System.currentPageReference().getParameters().get('yr');
   
   // allow a month to be passed in on the url as mo=10
   if (m_param != null) { 
        Integer mi = Integer.valueOf(m_param); 
        if (mi > 0 && mi <= 12) {
          d = Date.newInstance(d.year(),mi,d.day());
        }
   }
   // and year as yr=2008
   if (y_param != null) { 
        Integer yr = Integer.valueOf(y_param); 
        d = Date.newInstance(yr, d.month(), d.day());
   }

   setMonth(d);
  }
 
  public List<Month.Week> getWeeks() { 
    system.assert(month!=null,'month is null');
    return month.getWeeks();
  }
  
  public Month getMonth() { return month; } 


  private void setMonth(Date d) { 
    month = new Month(d);  
    system.assert(month != null); 

    Date[] da = month.getValidDateRange();  // gather events that fall in this month
    events = [ select id,subject,description,activitydate,activitydatetime,DurationInMinutes
        from Event 
        where activitydate >= :da[0] AND activityDate <= :da[1]
        order by activitydatetime];

    month.setEvents(events);  // merge those events into the month class
  }
  
  private void addMonth(Integer val) { 
    Date d = month.getFirstDate();
    d = d.addMonths(val);
    setMonth(d);
  }

  private List<Event> events;
  private Month month;
}