public class Month {
    private List<Week> weeks; 
    public Date firstDate; // always the first of the month
    private Date upperLeft; 
    
    public List<Date> getValidDateRange() { 
        // return one date from the upper left, and one from the lower right
        List<Date> ret = new List<Date>();
        ret.add(upperLeft);
        ret.add(upperLeft.addDays(5*7) );
        return ret;
    }
    
    public String getMonthName() { 
        return DateTime.newInstance(firstDate.year(),firstdate.month(),firstdate.day()).format('MMMM');
    } 
    
    public String getYearName() { 
        return DateTime.newInstance(
        firstDate.year(),firstdate.month(),firstdate.day()).format('yyyy');
    } 
    
    public String[] getWeekdayNames() { 
        Date today = system.today().toStartOfWeek();
        DateTime dt = DateTime.newInstanceGmt(today.year(),today.month(),today.day());      
        list<String> ret = new list<String>();
        for(Integer i = 0; i < 7;i++) { 
            ret.add( dt.formatgmt('EEEE') );
            dt= dt.addDays(1);
        } 
        return ret;
    }
    
    public Date getfirstDate() { return firstDate; } 

    public Month( Date value ) {
        weeks = new List<Week>();
        firstDate = value.toStartOfMonth();
        upperLeft = firstDate.toStartOfWeek();
        Date tmp = upperLeft;
        for (Integer i = 0; i < 5; i++) {
            Week w = new Week(i+1,tmp,value.month());   
            system.assert(w!=null); 
            this.weeks.add( w );
            tmp = tmp.addDays(7);
        }

    }
 
    public void setEvents(List<Event> ev) { 
        // merge these events into the proper day 
        for(Event e:ev) { 
            for(Week w:weeks) { 
                for(Day c: w.getDays() ) { 
                    if ( e.ActivityDate.isSameDay(c.theDate))  { 
                        // add this event to this calendar date
                        c.eventsToday.add(new EventItem(e));
                        // add only three events, then a More... label if there are more
                    } 
                } 
            } 
        }
    }
    
    public List<Week> getWeeks() { 
        system.assert(weeks!=null,'could not create weeks list');
        return this.weeks; 
    }
        

    /* 
     * helper classes to define a month in terms of week and day
     */
    public class Week {
     public List<Day> days;
     public Integer weekNumber; 
     public Date startingDate; // the date that the first of this week is on
     // so sunday of this week
     
     public List<Day> getDays() { return this.days; }
     
     public Week () { 
        days = new List<Day>();     
     }
     public Week(Integer value,Date sunday,Integer month) { 
        this();
        weekNumber = value;
        startingDate = sunday;
        Date tmp = startingDate;
        for (Integer i = 0; i < 7; i++) {
            Day d = new Day( tmp,month ); 
            tmp = tmp.addDays(1);
            d.dayOfWeek = i+1;          
        //  system.debug(d);
            days.add(d);
        } 
        
     }
     public Integer getWeekNumber() { return this.weekNumber;}
     public Date getStartingDate() { return this.startingDate;}
     
    }
    
    public class Day {
         
        public Date         theDate;
        public List<EventItem>  eventsToday; // list of events for this date
        public Integer      month, dayOfWeek;
        public String       formatedDate; // for the formated time  
        private String      cssclass = 'calActive';
         
        public Date         getDate() { return theDate; }
        public Integer      getDayOfMonth() { return theDate.day(); }
        public String       getDayOfMonth2() { 
            if ( theDate.day() <= 9 ) 
                return '0'+theDate.day(); 
            return String.valueof( theDate.day()); 
        }
        public Integer getDayOfYear() { return theDate.dayOfYear(); }
        public List<EventItem>  getDayAgenda() { return eventsToday; }
        public String       getFormatedDate() { return formatedDate; }
        public Integer      getDayNumber() { return dayOfWeek; }
        public List<EventItem>  getEventsToday() { return eventsToday; }
        public String       getCSSName() {  return cssclass; }
        
        public Day(Date value,Integer vmonth) { 
            theDate=value; month=vmonth;        
            formatedDate = '12 21 08';// time range..
            //9:00 AM - 1:00 PM
            eventsToday = new List<EventItem>();  
            // three possible Inactive,Today,Active  
            if ( theDate.daysBetween(System.today()) == 0 ) cssclass ='calToday';
            // define inactive, is the date in the month?
            if ( theDate.month() != month) cssclass = 'calInactive';
        }
            
    }

/*  static testMethod void testMe() {
        Month m = new Month( Date.newInstance(2007,11,1) );
        system.assert(m!=null); 
        List<Week> l = m.getWeeks(); 
        repeatcon r = new repeatcon(); 
        system.debug(m.getMonthName());
        Month mm = r.getMonth();
        //system.debug(mm); 
        system.debug(m.getFirstDate());
        system.debug(m.getWeekdayNames());
        for(Week w:r.getWeeks()) { 
            for(Day c:w.days) {   
                if (c.eventsToday.size() > 0 ) { 
                    String ss = String.valueOf(c.eventsToday[0].ev.ActivityDate);
                    ss = c.eventsToday[0].ev.ActivityDateTime.format('MMMM a');
                    //system.debug(ss);
                    //system.debug(c.eventsToday[0].ev);
                } 
            } 
        } 
    }*/
}