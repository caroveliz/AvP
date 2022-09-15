public class MembershipFeeCalculator {

    public Client_Program__c program { get; set; }
    
    public decimal membershipFeePerHour {
        get {
            if (program.Annual_Membership_Fee__c == null)
                return 0;
            if (program.Grand_Total_Billed_Hours__c == null)
                return 0;
            return program.Annual_Membership_Fee__c / program.Grand_Total_Billed_Hours__c;
        }
    }
    
    public MembershipFeeCalculator(ApexPages.StandardController ctrl) {
        program = [SELECT Id, Name, Annual_Membership_Fee__c, Grand_Total_Billed_Hours__c FROM Client_Program__c WHERE Id = :ctrl.getId()];
    }
}