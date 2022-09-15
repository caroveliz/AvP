@istest
public with sharing class TestAviationPageController {

    static testMethod void validateTestAviationPageController(){

        list<Account>lstAccount = TestDataFactory.CreateAccount(1,'TestAccount');
        insert lstAccount;

        list<Contact>lstContact = TestDataFactory.CreateContact(1,'TestContact', lstAccount[0].id);
        insert lstContact;

        UserLicense objUserLicense = [SELECT Id 
                         FROM UserLicense 
                         where Name ='Customer Community Plus' limit 1];
        list<Profile>lstProfile = [SELECT Id,
                                          UserLicenseId 
                                     FROM Profile 
                                     where UserLicenseId=: objUserLicense.Id
                                     limit 1];
        list<Profile>lstProfileAdmin = [SELECT Id,
                                          UserLicenseId 
                                     FROM Profile 
                                     where Name='System Administrator'
                                     limit 1];
        list<User>lstUser = TestDataFactory.CreateUser(1, lstProfile[0].id, lstContact[0].id);
        insert lstUser;
        User objUser= [select id from User where ProfileId=:lstProfileAdmin[0].Id limit 1];

        list<Opportunity>lstOpportunity = TestDataFactory.createOpportunity(1,'TestOpportunity',lstAccount[0].Id);
        lstOpportunity[0].Send_Authorization_Form_to__c = lstContact[0].Id;
        insert lstOpportunity;

        list<Quarterly_Summary__c>lstQuarterlySumm = TestDataFactory.createQuarterlySummary(1, lstAccount[0].id);
        insert lstQuarterlySumm;

        TASKRAY__Project_Task__c objTaskRay = new TASKRAY__Project_Task__c();
        objTaskRay.Name= 'Test';
        insert objTaskRay;
 
        list<Time__c> lstTime = new list<Time__c>();
        Time__c objTime = new Time__c();
        objTime.Account__c = lstAccount[0].Id;
        objTime.Hours__c = 0.25;
        objTime.Date__c= date.today();
        objTime.TaskRay_Task__c=objTaskRay.Id;
        lstTime.add(objTime);

        Time__c objTime1 = new Time__c();
        objTime1.Account__c = lstAccount[0].Id;
        objTime1.Hours__c = 0.75;
        objTime1.Date__c= date.today();
        objTime1.TaskRay_Task__c=objTaskRay.Id;
        lstTime.add(objTime1);
        insert lstTime;

        Client_Value_Proposition_del__c objValue= new Client_Value_Proposition_del__c();
        objValue.Account__c = lstAccount[0].Id;
        objValue.CVP_Savings__c= 400;
        insert objValue;

        System.runAs(lstUser[0]){
            AviationHomePageController objAviationHomePageController = new AviationHomePageController();    
        system.assertEquals(1, objAviationHomePageController.dblAccHours);
        }                
        //System.runAs( lstUser[0] );
    }// end method

    // method to test the data for flown and Dollar table for current year
    static testMethod void validateDollarFlownData(){
        list<Account>lstAccount = TestDataFactory.CreateAccount(1,'TestAccount');
        insert lstAccount;
        
        list<Contact>lstContact = TestDataFactory.CreateContact(1,'TestContact', lstAccount[0].id);
        insert lstContact;
        
        UserLicense objUserLicense = [SELECT Id 
                         FROM UserLicense 
                         where Name ='Customer Community Plus' limit 1];
        list<Profile>lstProfile = [SELECT Id,
                                          UserLicenseId 
                                     FROM Profile 
                                     where UserLicenseId=: objUserLicense.Id
                                     limit 1];
        list<Profile>lstProfileAdmin = [SELECT Id,
                                          UserLicenseId 
                                     FROM Profile 
                                     where Name='System Administrator'
                                     limit 1];
        list<User>lstUser = TestDataFactory.CreateUser(1, lstProfile[0].id, lstContact[0].id);
        insert lstUser;
        Operator_Program__c objOpProgram= new Operator_Program__c();
        objOpProgram.Operator__c =lstAccount[0].Id;
        objOpProgram.Name='This is test';
        objOpProgram.Program_Status__c = 'Available';
        insert objOpProgram;
        
        User objUser= [select id from User where ProfileId=:lstProfileAdmin[0].Id limit 1];
        
        Client_Program__c objProgram= new Client_Program__c();
        objProgram.Name='Contract 1';
        objProgram.Program_Name__c='Program 1';
        objProgram.Account__c= lstAccount[0].Id;
        objProgram.Operator_Program__c=objOpProgram.Id;
        objProgram.Client_Program_Status__c = 'Active';
        insert objProgram;
        
        Airport__c objAirport = new Airport__c();
        objAirport.Name='ICOO';
        objAirport.Airport_Name__c='International';
        insert objAirport;

        Airport__c objAirport1 = new Airport__c();
        objAirport1.Name='SST';
        objAirport1.Airport_Name__c='International';
        insert objAirport1;

        Case objCase =new Case();
        objCase.Status= 'Booked';
        objCase.AccountId=  lstAccount[0].Id;
        objCase.ContactId=lstContact[0].Id;
        objCase.Origin='Email';
        objCase.Date_Requested__c= date.today();
        objCase.Trip_Type__c='One-Way';
        objCase.Domestic_or_International__c='International';
        objCase.SuppliedName='test';
        objCase.Date_of_Trip__c= date.today();
        objCase.Purpose_of_Trip__c='Business';
        objCase.Departing_Airport__c= objAirport1.Id;
        objCase.Arriving_Airport__c= objAirport1.Id;
        objCase.Description= 'Itinerary/Dates/Routing/Times';
        objCase.Subject='test';
        insert objCase;

        Client_Program_Year__c objYear = new Client_Program_Year__c();
        objYear.Client_Program__c = objProgram.Id;
        insert objYear;

         System.runAs(lstUser[0]){
            AviationHomePageController objAviationHomePageController = new AviationHomePageController();    
            system.assertEquals(1, objAviationHomePageController.setPrName.size());
        }    
    }// end method
}// end class