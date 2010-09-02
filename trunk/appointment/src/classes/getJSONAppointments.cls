public class getJSONAppointments {

    public JSONObject json {get;set;}
    
    /* invoked on an Ajax request */    
    public void getAppointments() 
    {

        try
        {

            Map<string,string> params = ApexPages.currentPage().getParameters();
            json = new JSONObject();
            
            // Do SOQL query to see if there are any records !
            List<Appointment__c> records = new List<Appointment__c>();
            datetime startDate = datetime.newInstance(0);
            Integer startInt = integer.valueOf(params.get('start'));
            startDate = startDate.addSeconds(startInt);
            
            datetime endDate = datetime.newInstance(0);
            Integer endInt = integer.valueOf(params.get('end'));
            endDate = endDate.addSeconds(endInt);
            
            records = [Select Id,
                              Start_DateTime__c,
                              Stop_DateTime__c,
                              Duration_In_Minutes__c,
                              Customer__r.Full_Name__c,
                              Staff_Service__r.Staff__r.Full_Name__c,
                              Staff_Service__r.Service__r.Name,
                              Status__c
                              from Appointment__c 
                              where Start_DateTime__c>=:startDate 
                              and Stop_DateTime__c<=:endDate ];

            List<JSONObject.value> values = new List<JSONObject.value>(); 

            System.debug(Logginglevel.ERROR);           
            System.debug(Logginglevel.INFO, 'Start Param '+params.get('start')+' End Param' +params.get('end'));     
                  
            if (!records.isEmpty()) 
            {

                // JSONify the results !
                String ProjectName;
                for (Appointment__c a : records) 
                {

                    try
                    {
                    
                        JSONObject cjson = new JSONObject();
                        cjson.putOpt('"id"', new JSONObject.value(a.Id));
                        
                        // ProjectName = a.Project_Name__c.replace('"' , '');
                        
                        // cjson.putOpt('"title"', new JSONObject.value(a.Project_Number__c + ' ' +ProjectName+ ' N: '+a.Study_N__c+ ' ' +a.Location__r.name));
                        // cjson.putOpt('"allDay"', new JSONObject.value(a.All_Day__c));
        
                        // Convert the times into unix timestamp format for the calendar
                        Long startDateTime = a.Start_DateTime__c.getTime()/1000;
                        Long endDateTime = a.Stop_DateTime__c.getTime()/1000;
        
                        cjson.putOpt('"start"', new JSONObject.value(startDateTime.intValue()));
                        cjson.putOpt('"end"', new JSONObject.value(endDateTime.intValue()));
                        cjson.putOpt('"duration"', new JSONObject.value(a.Duration_In_Minutes__c));
                        cjson.putOpt('"customer"', new JSONObject.value(a.Customer__r.Full_Name__c));
                        cjson.putOpt('"staff"', new JSONObject.value(a.Staff_Service__r.Staff__r.Full_Name__c));
                        cjson.putOpt('"service"', new JSONObject.value(a.Staff_Service__r.Service__r.Name));
                        cjson.putOpt('"status"', new JSONObject.value(a.Status__c));
                        cjson.putOpt('"linkurl"', new JSONObject.value('https://na5.salesforce.com/'+a.Id));

                        // cjson.putOpt('"client"', new JSONObject.value(a.Client__c));
                        // cjson.putOpt('"PM"', new JSONObject.value(a.Project_Manager__c));
                        // cjson.putOpt('"PA"', new JSONObject.value(a.Project_Associate__c));
                        // cjson.putOpt('"status"', new JSONObject.value(a.status__c));
                        // cjson.putOpt('"test"', new JSONObject.value(a.Project_Name__c));
                        // cjson.putOpt('"linkurl"', new JSONObject.value('https://na2.salesforce.com/'+a.Id));
                        // cjson.putOpt('"className"', new JSONObject.value(a.status__c + ' ' + a.Id + ' ' + a.Local_Remote_Indicator__c));
                        // cjson.putOpt('"StudyN"', new JSONObject.value(a.Study_N__c));         
                        // cjson.putOpt('"Location"', new JSONObject.value(a.Location__r.name)); 
                        // cjson.putOpt('"LRIndicator"', new JSONObject.value(a.Local_Remote_Indicator__c)); 
                        values.add(new JSONObject.value(cjson));
                        
                    }
                    catch(Exception e)
                    {
                        System.debug(Logginglevel.ERROR);
                        System.debug(Logginglevel.INFO, 'ERROR: Start Param '+params.get('start')+' End Param: ' +params.get('end')+' Error: '+e.getMessage());
                    }
                }    
            }
            else
            {
                JSONObject cjson = new JSONObject();
                cjson.putOpt('"data"', new JSONObject.value('No query records found. Start Param '+params.get('start')+' End Param' +params.get('end')));                  
                values.add(new JSONObject.value(cjson));               
            }

            json.putOpt('appointments', new JSONObject.value(values));

        }
        catch(Exception e)
        {
             Map<string,string> params = ApexPages.currentPage().getParameters();
             json = new JSONObject();            
             List<JSONObject.value> values = new List<JSONObject.value>();
             JSONObject cjson = new JSONObject();
             cjson.putOpt('"data"', new JSONObject.value('ERROR. Start Param: '+params.get('start')+' End Param: ' +params.get('end')+ 'Error: '+e.getMessage()));                  
             values.add(new JSONObject.value(cjson));  
             json.putOpt('appointments', new JSONObject.value(values));        
        }        

    }

    // Returns the JSON result string
    public String getResult() 
    {

       string jsonString = json.ValuetoString();
       jsonString = jsonString.replace('{appointments: [' , '[');
       jsonString = jsonString.replace('}]}' , '}]');
       return jsonString;
       
    }
    
}