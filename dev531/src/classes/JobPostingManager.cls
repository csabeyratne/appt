public with sharing class JobPostingManager {
 	
 	//Public attribute for position
    public Position__c position;
    
    //Constructor that accepts a position
    public JobPostingManager(Position__c constructorPosition) {
    	 //Assign the passed constructor value to the public attribute
    	 constructorPosition = position;
    }
    
    public void createJobPosting() {	
    	//Declare a list for the active job sites
		List<Job_Posting_Site__c> activeJobSites = new List<Job_Posting_Site__c>();
		
		//Get the list of the 'Active' sites
		activeJobSites = 
			[SELECT ID FROM Job_Posting_Site__c WHERE Status__c='A'];
		
		//Loop through the job sites and add the posting
		for(Job_Posting_Site__c jobSite : activeJobSites){		
			
			//Declare a new job posting
			Job_Posting__c job_posting = new Job_Posting__c();
			
			//Set the position for the posting from the public attribute
			job_posting.Position__c = position.Id;
			
			//Set the job posting site from the jobSite
			job_posting.Job_Posting_Site__c = jobSite.Id;
			
			//insert the posting
			insert job_posting;	
		}
    }
}