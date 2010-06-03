public class rssGet {

// Pass in the endpoint to be used using the string url
  public String getContent(String url) {

// Instantiate a new http object
    Http h = new Http();

// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('GET');

// Send the request, and return a response
    HttpResponse res = h.send(req);
  
     // Log the XML content
    System.debug(res.getBody());
  
   
    // Generate the HTTP response as an XML stream
    XmlStreamReader reader = res.getXmlStreamReader();
    
    // Read through the XML
    while(reader.hasNext()) {
      System.debug('Event Type:' + reader.getEventType());
      if (reader.getEventType() == XmlTag.START_ELEMENT) {
        System.debug(reader.getLocalName());
      }
      reader.next();
    }
    return res.getBody();
  }
  
  public string getSforceBlog() {
        return getContent('http://feeds.feedburner.com/SforceBlog');
  }
  
  
  
  // Create a class Feed for processing
   public class Entry {
     String name;
     String author; String summary, title;
   }

   Entry[] parseFeedEntries(XmlStreamReader reader) {
     Entry[] entries = new Entry[0];
     while(reader.hasNext()) {

//  Start at the beginning of the book and make sure that it is a book
         if (reader.getEventType() == XmlTag.START_ELEMENT) {
            if ('entry' == reader.getLocalName()) {

                Entry e = parseEntry(reader);
                entries.add(e);
            }
         }
        reader.next();
     }
    return entries;
   }

// Parse through the XML, deterimine the auther and the characters
   Entry parseEntry(XmlStreamReader reader) {
     Entry e = new Entry();
     e.author = reader.getAttributeValue('', 'author');
     while(reader.hasNext()) {
        if (reader.getEventType() == XmlTag.END_ELEMENT) {
           break;
        } else if (reader.getEventType() == XmlTag.CHARACTERS) {
           e.name = reader.getText();
        }
        reader.next();
     }
     return e;
   }

 
   // Test that the XML string contains specific values
   public static testMethod void t1() {

  
   String feed = '<?xml version="1.0" encoding="UTF-8"?>'+
'<feed xmlns="http://purl.org/atom/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:feedburner="http://rssnamespace.org/feedburner/ext/1.0" version="0.3">'+
  '<title>Force.com Blog</title>' +
  '<link rel="alternate" type="text/html" href="http://blog.sforce.com/sforce/" />' +
  '<id>tag:typepad.com,2003:weblog-125619</id>' +
  '<link rel="service.post" type="application/x.atom+xml" href="http://www.typepad.com/t/atom/weblog/blog_id=125619" title="Force.com Blog" />' +
  '<modified>2008-01-23T20:27:30Z</modified>' +
  '<tagline></tagline>' +
  '<generator url="http://www.typepad.com/">TypePad</generator>' +
  '<info type="application/xhtml+xml">' +
  '<div xmlns="http://www.w3.org/1999/xhtml">This is an Atom formatted XML site feed. It is intended to be viewed in a Newsreader or syndicated to another site. Please visit <a href="http://blog.sforce.com/sforce/">Force.com Blog</a> for more info.</div>' +
  '</info>' +
  '<entry>' +
    '<title>Tour de Force Global Kickoff - it\'s a wrap!</title>' +
    '<link rel="alternate" type="text/html" href="http://feeds.feedburner.com/~r/SforceBlog/~3/221839184/tour-de-force-g.html" />' +
    '<link rel="service.edit" type="application/x.atom+xml" href="http://www.typepad.com/t/atom/weblog/blog_id=125619/entry_id=44564390" title="Tour de Force Global Kickoff - it\'s a wrap!" />' +
    '<id>tag:typepad.com,2003:post-44564390</id>' +
    '<issued>2008-01-23T12:27:30-08:00</issued>' +
    '<modified>2008-01-23T20:27:30Z</modified>' +
    '<created>2008-01-23T20:27:30Z</created>' +
    '<summary>Thank you to everyone that joined us last Thursday in San Francisco as we kicked off Tour de Force - we\'re delighted that you were able help us launch the Tour de Force roadshow to unleash the Force.com platform around...</summary>' +
    '<author><name>Mark Trang</name></author>' +
    '<content type="application/xhtml+xml" xml:lang="en-US" xml:base="http://blog.sforce.com/sforce/"><div xmlns="http://www.w3.org/1999/xhtml">'+
        '<p>Thank you to everyone that joined us last Thursday in San Francisco as we kicked off Tour de Force - </p></div></content>'+
        '<feedburner:origLink>http://blog.sforce.com/sforce/2008/01/tour-de-force-g.html</feedburner:origLink></entry></feed>';
        
         rssGet demo = new rssGet();
     XmlStreamReader reader = new XmlStreamReader(feed);
     Entry[] feeds = demo.parseFeedEntries(reader);
     System.debug(feeds.size());
     for (Entry f : feeds) {
       System.debug(f);
     }
   }
}