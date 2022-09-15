@isTest
public class LegTriggerTest {

    @isTest
	public static void Test_SetEstimatedFlightTimeHours1() {
		
		// Data setup
		Account ac = new Account();
        ac.Name = 'NetJets Aviation'; 
		insert ac;
        
        Operator_Program__c op = new Operator_Program__c();
        op.Operator__c = ac.Id;
        op.Program_Status__c = 'Available';
        insert op;
        
		Client_Program__c cp = new Client_Program__c();
        cp.Client_Program_Status__c = 'Active';
        cp.Contracted_Aircraft_Type__c = 'Challenger 650';
        cp.Operator_Program__c = op.Id;
        insert cp;
        
        Case tm = new Case();
        tm.AccountId = ac.Id;
        insert tm;
		
		// Run the code
		Test.startTest();
		
        Leg__c l = new Leg__c();
        l.RecordTypeId = Schema.SObjectType.Leg__c.getRecordTypeInfosByDeveloperName().get('Leg').getRecordTypeId();
        l.Client_Program__c = cp.Id;
        l.Trip_Manager_Number__c = tm.Id;
        l.Aircraft_Requested__c = 'Citation X';
        l.Original_Estimated_Billable_Time__c = 100;
        insert l;
        
		Test.stopTest();
		
		// Verify Results
		Conversion_Table__mdt ct = [SELECT Exchange_Rate__c FROM Conversion_Table__mdt 
                                       WHERE Company__c = 'NetJets Aviation' AND From_Plane__c = 'Challenger 650' AND To_Plane__c = 'Citation X'];
        l = [SELECT Estimated_Flight_Time_hours__c FROM Leg__c WHERE Id = :l.Id];
        System.assertEquals(100 * ct.Exchange_Rate__c, l.Estimated_Flight_Time_hours__c);
	}
    
    @isTest
	public static void Test_SetEstimatedFlightTimeHours2() {
		
		// Data setup
		Account ac = new Account();
        ac.Name = 'NetJets Aviation'; 
		insert ac;
        
        Operator_Program__c op = new Operator_Program__c();
        op.Operator__c = ac.Id;
        op.Program_Status__c = 'Available';
        insert op;
        
		Client_Program__c cp = new Client_Program__c();
        cp.Client_Program_Status__c = 'Active';
        cp.Contracted_Aircraft_Type__c = 'Challenger 650';
        cp.Operator_Program__c = op.Id;
        insert cp;
        
        Client_Program_Conversion_Override__c cpco = new Client_Program_Conversion_Override__c();
        cpco.Program__c = cp.Id;
        cpco.To_Plane__c = 'Citation X';
        cpco.Exchange_Rate__c = 0.77;
        insert cpco;
        
        Case tm = new Case();
        tm.AccountId = ac.Id;
        insert tm;
		
		// Run the code
		Test.startTest();
		
        Leg__c l = new Leg__c();
        l.RecordTypeId = Schema.SObjectType.Leg__c.getRecordTypeInfosByDeveloperName().get('Leg').getRecordTypeId();
        l.Client_Program__c = cp.Id;
        l.Trip_Manager_Number__c = tm.Id;
        l.Aircraft_Requested__c = 'Citation X';
        l.Original_Estimated_Billable_Time__c = 100;
        insert l;
        
		Test.stopTest();
		
		// Verify Results
		l = [SELECT Estimated_Flight_Time_hours__c FROM Leg__c WHERE Id = :l.Id];
        System.assertEquals(77, l.Estimated_Flight_Time_hours__c);
	}

}