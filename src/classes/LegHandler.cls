public class LegHandler {

    public static void SetEstimatedFlightTimeHours(List<Leg__c> newList) {

        // Gather data for conversion table
        Set<Id> programIds = new Set<Id>();
        Set<String> companies = new Set<String>();
        Set<String> fromPlanes = new Set<String>();
        Set<String> toPlanes = new Set<String>();
        for (Leg__c l : newList) {
            if (!String.isEmpty(l.Aircraft_Requested__c)) {
                toPlanes.add(l.Aircraft_Requested__c);
            }
            if (l.Client_Program__c != null) {
            	programIds.add(l.Client_Program__c);
            }
        }
        
        Map<Id, Map<string, decimal>> conversionRates = new Map<Id, Map<string, decimal>>(); // Program Id -> To Plane -> Rate
        Map<Id, Client_Program__c> programMap = new Map<Id, Client_Program__c>();
        
        if (programIds.size() > 0) {
            programMap = new Map<Id, Client_Program__c>([SELECT Id, Contracted_Aircraft_Type__c, Operator_Program__r.Operator__r.Name,
                                                         		(SELECT To_Plane__c, Exchange_Rate__c FROM Client_Program_Conversion_Overrides__r)
                                                         FROM Client_Program__c WHERE Id IN :programIds AND Contracted_Aircraft_Type__c != null]);
            for (Client_Program__c program : programMap.values()) {
                if (!String.isEmpty(program.Contracted_Aircraft_Type__c)) {
                    fromPlanes.add(program.Contracted_Aircraft_Type__c);
                }
                if (!String.isEmpty(program.Operator_Program__r.Operator__r.Name)) {
                    companies.add(program.Operator_Program__r.Operator__r.Name);
                }
                
                conversionRates.put(program.Id, new Map<string, decimal>());
                for (Client_Program_Conversion_Override__c cpco : program.Client_Program_Conversion_Overrides__r) {
                    conversionRates.get(program.Id).put(cpco.To_Plane__c, cpco.Exchange_Rate__c);
                }
            }
        }
        
        if (fromPlanes.size() > 0 && toPlanes.size() > 0) {
            for (Conversion_Table__mdt ct : [SELECT Company__c, From_Plane__c, To_Plane__c, Exchange_Rate__c
                                                 FROM Conversion_Table__mdt 
                                                 WHERE Company__c IN :companies AND From_Plane__c IN :fromPlanes AND To_Plane__c IN :toPlanes])
        	{
                for (Id programId : programMap.keySet()) {
                    if (!conversionRates.containsKey(programId))
                        conversionRates.put(programId, new Map<String, decimal>());
                    if (programMap.get(programId).Operator_Program__r.Operator__r.Name == ct.Company__c) {
                        if (!conversionRates.get(programId).containsKey(ct.To_Plane__c)) {
                            conversionRates.get(programId).put(ct.To_Plane__c, ct.Exchange_Rate__c);
                        }
                    }
                }
            }
            
            // Set the estimated flight time hours
            for (Leg__c l : newList) {
                if (!String.isEmpty(l.Aircraft_Requested__c) && l.Estimated_Flight_Time_hours__c == NULL ) {
                    if (l.Client_Program__c != null) {
                        if (conversionRates.containsKey(l.Client_Program__c)) {
                            if (conversionRates.get(l.Client_Program__c).containsKey(l.Aircraft_Requested__c)) {
                                l.Estimated_Flight_Time_hours__c = (l.Original_Estimated_Billable_Time__c == null ? 0 : l.Original_Estimated_Billable_Time__c) * conversionRates.get(l.Client_Program__c).get(l.Aircraft_Requested__c);
                            }
                        }
                    }
                }
            }
        }
    }
    
}