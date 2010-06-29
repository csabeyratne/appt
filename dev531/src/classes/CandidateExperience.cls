public with sharing class CandidateExperience {

	//Returns a list of candidates with the specified years of experience
	public List<Candidate__c> getCandidatesWithExperience(Integer yearsExperience){
		
		//Declare a new list
		List<Candidate__c> experiencedCandidates = new List<Candidate__c>();
		
		//Set the list equal to the results of the SOQL query
		experiencedCandidates = [SELECT 
				Name, First_Name__c, Last_Name__c, Id, Gender__c, Street_Address_2__c, Street_Address_1__c, City__c,  
				State_Province__c, Zip_Postal_Code__c, Country__c,  Phone__c, Fax__c, Email__c, Years_of_Experience__c 
			FROM Candidate__c 
			WHERE Years_of_Experience__c >=:yearsExperience ];
		
		//Return the List
		return experiencedCandidates;
	}
}