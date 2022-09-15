public with sharing class EditOverrides {
    
    public boolean hasError { get; set; }
    public string fromPlane { get; set; }

    public List<SelectOption> options { get; set; }

    public EditOverrides(ApexPages.StandardController ctrl) {

        hasError = false;

        Client_Program_Conversion_Override__c record = (Client_Program_Conversion_Override__c)ctrl.getRecord();
        if (record.Program__c == null) {
            hasError = true;
            return;
        }

        Client_Program__c cp = [SELECT Contracted_Aircraft_Type__c, Operator_Program__r.Operator__r.Name FROM Client_Program__c WHERE Id = :record.Program__c];
        fromPlane = cp.Contracted_Aircraft_Type__c;

        options = new List<SelectOption>();
        for (Plane_for_Company__mdt mdt : [SELECT Plane__c FROM Plane_for_Company__mdt WHERE Company__c = :cp.Operator_Program__r.Operator__r.Name]) {
            options.add(new SelectOption(mdt.Plane__c, mdt.Plane__c));
        }
        options.sort();
    }

}