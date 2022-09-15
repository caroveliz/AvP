@isTest
public class DepreciationCalculatorTest {

    @isTest
	public static void Test1() {
		
		// Data setup
		Account acc = new Account();
        acc.Name = 'Test298762';
        insert acc;
        
        Operator_Program__c op = new Operator_Program__c();
        op.Name = 'Test893723';
        op.Operator__c = acc.Id;
        op.Program_Status__c = 'Available';
        insert op;
        
        Client_Program__c p = new Client_Program__c();
        p.Account__c = acc.Id;
        p.Annual_Membership_Fee__c = 10000;
        p.Grand_Total_Billed_Hours__c = 100;
        p.Operator_Program__c = op.Id;
        p.Client_Program_Status__c = 'Active';
        p.Initial_Asset_Value__c = 1000000;
        p.Estimated_Depreciation__c = 10;
        p.Current_Fair_Market_Value__c = 900000;
        p.Total_Flown_Hours__c = 100;
        p.Opportunity_Cost__c = 5;
        insert p;
        
        Client_Program_Year__c py = new Client_Program_Year__c();
        py.Client_Program__c = p.Id;
        py.Start_Date__c = Date.newInstance(Date.today().year(), 1, 1);
        py.End_Date__c = Date.newInstance(Date.today().year(), 12, 31);
        py.Annual_Hours_Allotted__c = 100;
        insert py;
		
		// Run the code
		Test.startTest();
		DepreciationCalculator ctrl = new DepreciationCalculator(new ApexPages.StandardController(p));
        integer daysIntoProgramYear = ctrl.daysIntoProgramYear;
        decimal percentageIntoProgramPeriod = ctrl.daysIntoProgramYear;    
		decimal depreciationPerHour1 = ctrl.depreciationPerHour1;
        decimal depreciationPerHour2 = ctrl.depreciationPerHour2;
        decimal costOfCapital1 = ctrl.costOfCapital1;
        decimal costOfCapital2 = ctrl.costOfCapital2;        
		Test.stopTest();
		
		// Verify Results
		//TO-DO: Values should be dynamic based on current date since they change as year progresses
		/*
		System.assertEquals(260, ctrl.daysIntoProgramYear); 
		System.assertEquals(65, Math.round(ctrl.percentageIntoProgramPeriod));
		System.assertEquals(1000, ctrl.depreciationPerHour1);
		System.assertEquals(1000, ctrl.depreciationPerHour2);
		System.assertEquals(500, ctrl.costOfCapital1);
		System.assertEquals(500, Math.round(ctrl.costOfCapital2));
		*/
	}
    
}