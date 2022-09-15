@isTest
public class MembershipFeeCalculatorTest {

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
        p.Annual_Membership_Fee__c = 10000;
        p.Grand_Total_Billed_Hours__c = 100;
        p.Operator_Program__c = op.Id;
        p.Client_Program_Status__c = 'Active';
        insert p;
		
		// Run the code
		Test.startTest();
		MembershipFeeCalculator ctrl = new MembershipFeeCalculator(new ApexPages.StandardController(p));
        Decimal fee = ctrl.membershipFeePerHour;
		Test.stopTest();
		
		// Verify Results
		System.assertEquals(100, fee);
	}

}