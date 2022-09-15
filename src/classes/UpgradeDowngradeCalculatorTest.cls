@isTest
public class UpgradeDowngradeCalculatorTest {
    
	@isTest
    public static void Test1(){
        
		// Data setup
		Account ac = new Account();
        ac.Name = 'Flexjet, LLC'; 
		insert ac;
        
        Operator_Program__c op = new Operator_Program__c();
        op.Operator__c = ac.Id;
        op.Program_Status__c = 'Available';
        insert op;
        
        Client_Program__c cp = new Client_Program__c();
        cp.Account__c = ac.Id;
        cp.Operator_Program__c = op.Id;
        cp.Client_Program_Status__c = 'Active';
        cp.Current_MMF__c = 100;
        cp.Monthly_Lease_Fee__c = 100;
        cp.Total_Allotted_Hours__c = 100;
        cp.Current_OHF__c = 100;
        cp.Latest_Fuel__c = 100;
        cp.Contracted_Aircraft_Type__c = 'Phenom 300';
        insert cp;

        Client_Program_Year__c cpp = new Client_Program_Year__c();
        cpp.Client_Program__c = cp.Id;
        cpp.Business_Account__c = ac.Id;
        cpp.Annual_Hours_Allotted__c = 5;
        insert cpp;
        
        Case tm = new Case();
        tm.AccountId = ac.Id;
        insert tm;
        
        Leg__c l = new Leg__c();
        l.RecordTypeId = Schema.SObjectType.Leg__c.getRecordTypeInfosByDeveloperName().get('Leg').getRecordTypeId();
        l.Client_Program__c = cp.Id;
        l.Client_Program_Year__c = cpp.Id;
        l.Trip_Manager_Number__c = tm.Id;
        l.Actual_Flight_Time_hours__c = 3;
        insert l;
        
		// Run the code
        Test.startTest();
		UpgradeDowngradeCalculatorCmp ctrl = new UpgradeDowngradeCalculatorCmp();
        ctrl.programPeriodIdX = cpp.Id;
        ctrl.BilledHours = 3;
        decimal allInCost = ctrl.AllInCost;
        try {
            ctrl.legIdX = l.Id;
        } catch (Exception ex) {}
        Test.stopTest();
        
        // Verify Results
        System.assertEquals(2040, allInCost);
    }
}