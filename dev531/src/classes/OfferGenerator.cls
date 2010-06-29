public with sharing class OfferGenerator {

	public ID createCandidate(string firstName, string lastName){
		
		//Declare Candidate__c called newCandidate
		Candidate__c newCandidate = new Candidate__c();
		
		//Set the First_Name__c field to the parameter firstName
		newCandidate.First_Name__c = firstName;
		
		//Set the Last_Name__c field to the parameter lastName
		newCandidate.Last_Name__c = lastName;
		
		//Use the Database methods to Insert newCandidate 
		//Make sure to use a save results called results
		Database.SaveResult results = Database.insert(newCandidate);
		
		//Return the ID from the SaveResults object
		return results.getId();
	}


	public ID createJobApplication(ID candidateForJobAppId){
		
		//Declare Job_Application__c called jobApp
		Job_Application__c jobApp = new Job_Application__c();
		
		//Set the Candidate__c property of jobApp to to the ID 
		jobApp.Candidate__c  = candidateForJobAppId;
		
		//Use the Database methods to Insert jobApp
		//Make sure to use a save results
		Database.SaveResult results = Database.insert(jobApp);
		
		//Return the ID from the SaveResults object
		return results.getId();
	}
	
	
	public ID createOffer(ID jobAppForOfferId){
		
		Offer__c newOffer = new Offer__c();
		
		//Set the Offer_Date__c to today's date
		newOffer.Offer_Date__c = Date.today();
		
		//Set the Offer_Expiration_Date__c to one one month from today
		newOffer.Offer_Expiration_Date__c = Date.today().addMonths(1);
		
		//Set the Actual_Salary__c of newOffer to $60,000
		newOffer.Actual_Salary__c = 60000;
		
		//Set the Status__c of newOffer to Sent
		newOffer.Status__c ='Sent';
		
		//Set the Job_Application__c of newOffer to the ID of jobApp
		newOffer.Job_Application__c = jobAppForOfferId;
		
		//Use the Database methods to insert new offer
		//Make sure to use a save results
		Database.SaveResult results = Database.insert(newOffer);
		
		//Return the ID from the SaveResults object
		return results.getId();
	}
}