public class DepreciationCalculator {

    public Client_Program__c program { get; set; }
    public Client_Program_Year__c currentPeriod { get; set; }
    
    public integer daysIntoProgramYear {
        get {
            if (currentPeriod == null || currentPeriod.Start_Date__c == null) return 0;
            return currentPeriod.Start_Date__c.daysBetween(Date.today());
        }
    }
    
    public decimal percentageIntoProgramPeriod {
        get {
            return daysIntoProgramYear * 100.0 / 365;
        }
    }
    
    public decimal depreciationPerHour1 {
        get {
            if (program.Initial_Asset_Value__c == null) return 0;
            if (program.Estimated_Depreciation__c == null) return 0;
            if (currentPeriod == null || currentPeriod.Annual_Hours_Allotted__c == null) return 0;
            return program.Initial_Asset_Value__c * program.Estimated_Depreciation__c / (currentPeriod.Annual_Hours_Allotted__c * 100);
        }
    }
    
    public decimal depreciationPerHour2 {
        get {
            if (program.Depreciated_Value__c == null) return 0;
            if (program.Total_Flown_Hours__c == null) return 0;
            return program.Depreciated_Value__c / program.Total_Flown_Hours__c;
        }
    }
    
    public decimal costOfCapital1 {
        get {
            if (program.Initial_Asset_Value__c == null) return 0;
            if (program.Opportunity_Cost__c == null) return 0;
            if (currentPeriod == null || currentPeriod.Annual_Hours_Allotted__c == null) return 0;
            return program.Initial_Asset_Value__c * program.Opportunity_Cost__c / (currentPeriod.Annual_Hours_Allotted__c * 100);
        }
    }
    
    public decimal costOfCapital2 {
        get {
            if (currentPeriod == null || currentPeriod.Annual_Hours_Allotted__c == null) return 0;
            return daysIntoProgramYear * currentPerDay * 100 / (currentPeriod.Annual_Hours_Allotted__c * percentageIntoProgramPeriod);
        }
    }
    
    public decimal currentPerDay { get; set; }
    
    public List<CapitalYearWrapper> years { get; set; }
    
    public DepreciationCalculator(ApexPages.StandardController ctrl) {
    
        program = [SELECT Id, Name, Initial_Asset_Value__c, Current_Fair_Market_Value__c, Depreciated_Value__c, Total_Flown_Hours__c, Estimated_Depreciation__c, Opportunity_Cost__c,
                   		(SELECT Id, Name, Start_Date__c, End_Date__c, Program_Year__c, Annual_Hours_Allotted__c FROM Client_Program_Years__r ORDER BY Start_Date__c ASC) 
                   FROM Client_Program__c WHERE Id = :ctrl.getId()];
        
        currentPerDay = 0;
        
        if (program.Client_Program_Years__r.size() > 0) {
            Date cDate = Date.today();
            
            for (Client_Program_Year__c period : program.Client_Program_Years__r) {
                if (period.Start_Date__c <= cDate && period.End_Date__c > cDate) {
                    currentPeriod = period;
                }
            }
            if (currentPeriod == null) {
                if (program.Client_Program_Years__r[0].Start_Date__c > cDate)
                    currentPeriod = program.Client_Program_Years__r[0];
                if (program.Client_Program_Years__r[program.Client_Program_Years__r.size() - 1].End_Date__c < cDate)
                    currentPeriod = program.Client_Program_Years__r[program.Client_Program_Years__r.size() - 1];
            }
            
            
            years = new List<CapitalYearWrapper>();
            decimal yearly = program.Initial_Asset_Value__c == null ? 0 : program.Initial_Asset_Value__c;
            for (Client_Program_Year__c period : program.Client_Program_Years__r) {
                CapitalYearWrapper cyw = new CapitalYearWrapper();
                if (program.Opportunity_Cost__c != null)
                	cyw.total = yearly * program.Opportunity_Cost__c / 100;
                if (currentPeriod.Annual_Hours_Allotted__c != null)
                	cyw.perHour = cyw.total / currentPeriod.Annual_Hours_Allotted__c;
                cyw.perDay = cyw.total / 365;
                
                yearly += cyw.total;
                
                if (period == currentPeriod) {
                    currentPerDay = cyw.perDay;
                }
                
                years.add(cyw);
            }
        }
        
    }
    
    public class CapitalYearWrapper {
        public decimal total { get; set; }
        public decimal perHour { get; set; }
        public decimal perDay { get; set; }
        
        public CapitalYearWrapper() {
            total = 0;
            perHour = 0;
            perDay = 0;
        }
    }
    
}