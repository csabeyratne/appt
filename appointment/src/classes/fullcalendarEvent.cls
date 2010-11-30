public with sharing class fullcalendarEvent {
    public string title { get;         
        set {
            title = truncate( 
                value!=null?value:'', //String.escapeSingleQuotes( value!=null?value:'' ),
                30); 
            title = title.replaceAll('\n',' ');  
            title = title.replaceAll('\r',' '); 
        } 
    }
    public Id id { get; set; }						{ this.id = null; }
    public Id ownerid { get; set; }
    public boolean editable { get; set; } 			{ this.editable = true; }
    public boolean visible { get; set; } 			{ this.visible = true; }
    public string className { get; set; }			{ this.className = ''; }
    public string ownerName { get; set; }			{ this.ownerName = ''; }
    public string eventType { get; set; }			{ this.eventType = ''; }
    public string url { get; set; }
    public DateTime startDateTime { get; set; }
    public DateTime endDateTime { get; set; }
    public Date allDayDate { get; set; } 
    public String startMs { get {        return String.valueOf(startDateTime.getTime());    }} 
    public String endMs { get {        return String.valueOf(endDateTime.getTime());    }}
    public Boolean allDayEvent { get; set; } 		{ allDayEvent = false; } 
    public string description { get; 
        set { 
            description =  value!=null?value:'.'; //String.escapeSingleQuotes( value!=null?value:'' ); 
            description = description.replaceAll('\n','<br />');  
            description = description.replaceAll('\r',' '); 
        } 
    }
    public fullcalendarEvent() {	}    
	public fullcalendarEvent(Datetime s) {        startDateTime = s;    }
    public fullcalendarEvent(Datetime s, Id pId) {
        startDateTime = s;
        id = pId;
    }
    
    public string getStartISO() {
    	//System.Debug(LoggingLevel.INFO, this);
    	if ( allDayEvent && allDayDate != null ) return allDayDate.format(); 
        return dateToJSON(startDateTime);
    }
    public string getEndISO() { 
    	if ( allDayEvent  ) return endDateTime.formatGMT('MM/dd/yyyy'); 
        return dateToJSON(endDateTime);
    }
    public string getStartJS() {        return dateToJavaScript(startDateTime);    }
    public string getEndJS() {        return dateToJavaScript(endDateTime);    }
    
    public static string dateToJavaScript(datetime dtm) { 
        string ret = 'new Date(' + 
        dtm.year() + ', ' + (dtm.month()-1) + ', ' + dtm.day() + 
        ', '+dtm.hour() +', '+ dtm.minute() +', ' + dtm.second() + ')';  
        return ret;
    }  
    public static string dateToJSON(datetime dtm) { 
    	//return dtm.format('');
        string ret =   dtm.year() + '-' + (dtm.month()<10?'0':'' ) +
             dtm.month() +'-' + (dtm.day()<10?'0':'' ) + dtm.day() + 
        'T' + (dtm.hour()<10?'0':'' ) + dtm.hour() +':'+ 
            (dtm.minute()<10?'0':'' ) + dtm.minute() +':00';  
        return ret;
    }  
    static string truncate(string s,integer len) {
        if ( s.length() <= len) return s;
        return s.substring(0,len);
    }   
    
    public static testMethod void test() {
        Datetime t = Datetime.newInstance( 2010,9,9,0,0,0 );
        Event e = new Event(DurationInMinutes= 3,activitydatetime = t );
        
        insert e;
        e = [ select id, endDateTime from event where id = :e.id limit 1];
        system.debug( Logginglevel.INFO, e );
        fullcalendarEvent v = new fullcalendarEvent(t,e.id);
        v.description = 'foo';
        v.endDateTime = e.EndDateTime;
        system.debug( Logginglevel.INFO, v );
        
        v.title = 'bar sd sd sdf sdf sdf sdf sdf sd fsd fs df sdf sdf s dfs df sdf sdf sdf sdf ';
        system.assert( v.getStartJS() != null );
        
        system.assert( v.startMs != null);
        system.assert( v.endMs != null);
        
        
    }
    public static testMethod void test2() {
        Datetime t = Datetime.newInstance( 2010,9,9,0,0,0 );
    
        fullcalendarEvent v2 = new fullcalendarEvent(t);
        
        system.assert( v2.startMs != null);
        system.assert( v2.getStartISO() != null );
        system.assert( v2.getStartJS() != null);
        v2.endDateTime = t.addDays(1);
        system.assert( v2.getEndISO() != null ); 
        system.assert( v2.getEndJS() != null );
         
    }
}