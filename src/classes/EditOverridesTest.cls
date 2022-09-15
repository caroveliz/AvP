@isTest
public class EditOverridesTest {
    
    @isTest
	public static void Test1() {
		
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

        Client_Program_Conversion_Override__c cpco = new Client_Program_Conversion_Override__c();
        cpco.Program__c = cp.Id;
		
		// Run the code
		Test.startTest();
		EditOverrides ctrl = new EditOverrides(new ApexPages.StandardController(cpco));
		Test.stopTest();
		
		// Verify Results
		System.assert(ctrl.options.size() > 0);
	}

}