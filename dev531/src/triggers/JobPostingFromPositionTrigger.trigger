trigger JobPostingFromPositionTrigger on Position__c (after insert) {
	
	//Declare the JobPostingManger class
	JobPostingManager postingManager = new JobPostingManager(Trigger.new[0]);
	
	//Call the createJobPosting Method
	postingManager.createJobPosting();
}