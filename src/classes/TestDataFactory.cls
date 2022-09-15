public with sharing class TestDataFactory {

	public static list<Profile> fetchProfile(String strProfile){
		UserLicense objUserLicense = [SELECT Id 
                         FROM UserLicense 
                         where Name ='Customer Community Plus' limit 1];
		list<Profile>lstProfile = [SELECT Id,
		                                  UserLicenseId 
                                     FROM Profile 
                                     where UserLicenseId=: objUserLicense.Id
                                     limit 1];
		return lstProfile;
	}//End of fetchProfile
	
	public static list<user> CreateUser(Integer intCounter,Id profileId ,Id contactId){
		list<User> newUserList = new list<User>();
        for(Integer i=0 ; i<intCounter ; i++){
            User tempUser = new User();
            tempUser.Alias = 'standt';
            tempUser.Email='standarduser@testorg.com'; 
            tempUser.EmailEncodingKey='UTF-8'; 
            tempUser.LastName='Testing'; 
            tempUser.LanguageLocaleKey='en_US'; 
            tempUser.LocaleSidKey='en_US';
            tempUser.ProfileId = profileId;
            tempUser.UserName='standarduser7402267@testorg.com'+intCounter;
            tempUser.Division = 'Corporate';
            tempUser.TimeZoneSidKey='America/Los_Angeles';
            tempUser.ContactId = contactId;
            newUserList.add(tempUser);
        }
        return newUserList;
	}//End of CreateUser
	
	public static list<Account> CreateAccount(Integer intCounter,String strName){
		list<account>lstAccount = new list<Account>();
		for(Integer i=0 ; i<IntCounter ; i++){
			Account objAccount = new Account();
			objAccount.name = strName + i;
			lstAccount.add(objAccount);
		}
		return lstAccount; 
	}//End of CreateAccount
	
	public static list<Contact> CreateContact(Integer intCounter,String strLastName,String StrAccId){
		list<Contact>lstContact = new list<Contact>();
		for(Integer i=0 ; i<IntCounter ; i++){
			Contact objContact = new Contact();
			objContact.LastName = strLastName + i;
			objContact.AccountId = StrAccId;
			objContact.Client_Start_Date__c= date.today();
			lstContact.add(objContact);
		}
		return lstContact;
	}//End of CreateContact
	
	public static list<Opportunity> createOpportunity(Integer intCounter,String OppName,String StrAccId){
		list<Opportunity>lstOpportunity = new list<Opportunity>();
		for(Integer i=0 ; i<IntCounter ; i++){
			Opportunity objOpportunity  = new Opportunity();
			objOpportunity.Name = OppName + i;
			objOpportunity.CloseDate = date.Today();
			objOpportunity.Amount = 10000+i;
			objOpportunity.StageName = 'Closed Won';
			objOpportunity.AccountId= StrAccId;
			objOpportunity.Entire_Agreement_End_Date__c = date.today().addYears(1);
			lstOpportunity.add(objOpportunity);	            
		}
		return lstOpportunity;
	}//End of createOpportunity
	
	public static list<Quarterly_Summary__c> createQuarterlySummary(Integer intCounter,Id AccountId){
		list<Quarterly_Summary__c>lstQuarterSummary = new list<Quarterly_Summary__c>();
		for(Integer i=0 ; i<IntCounter ; i++){
			Quarterly_Summary__c objQuarterlySummary = new Quarterly_Summary__c();
			objQuarterlySummary.Client__c = AccountId;
			objQuarterlySummary.Aviation_Portfolio_Relationship_Status__c = 'Aviation Portfolio Relationship Status Test'+i;
			objQuarterlySummary.AvP_Relationship_Improvement_Areas__c = 'AvP Relationship Improvement Areas Test'+i;
			objQuarterlySummary.Main_Areas_of_AvP_Focus__c ='Main Areas of AvP Focus Test'; 
			objQuarterlySummary.Main_Areas_of_AvP_Impact_to_Client__c = 'Main Areas of AvP Impact to Client Test'+i;
			objQuarterlySummary.Portfolio_Optimization_Opportunities__c = 'Portfolio Optimization Opportunities Test'+i;
			objQuarterlySummary.Portfolio_Optimization_Successes__c = 'Portfolio Optimization Successes'+i;
			lstQuarterSummary.add(objQuarterlySummary);
		}
		return lstQuarterSummary;
	}//End of createQuarterlySummary
	
	public static list<Leg__c> createLeg(Integer intCounter,String strFliStatus,Id ContactId,integer intLegSequence,Id OwnerId){
		list<Leg__c>lstLeg = new list<Leg__c>();
		for(Integer i=0 ; i<IntCounter ; i++){
			Leg__c objLeg = new Leg__c();
			objLeg.Flight_Status__c = strFliStatus;
			objLeg.Lead_Passenger__c = ContactId;
			objLeg.Leg_Sequence_Number__c = intLegSequence;
			objLeg.Leg_Owner__c = OwnerId;
			objLeg.Departure_Date__c = date.today();
			//objLeg.Solution_Category__c = 
			lstLeg.add(objLeg);
		}
		return lstLeg;
	}  
}//End of TestDataFactory