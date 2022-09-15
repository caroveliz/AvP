public class UpgradeDowngradeCalculatorCmp {

    public Id programPeriodIdP { get; set; }
    public Id programPeriodIdX {
        get {
            return programPeriodIdP;
        }
        set {
            if (programPeriodIdP != null) return; // Avoid reloading the page when a change occurs
            programPeriodIdP = value;
            if (programPeriodIdP != null) {
                programPeriod = [SELECT Id, Annual_Hours_Allotted__c,
                                Client_Program__r.Operator_Program__r.Operator__r.Name, Client_Program__r.Annual_Hours_Contracted__c,
                                Client_Program__r.Current_MMF__c, Client_Program__r.Monthly_Lease_Fee__c, Client_Program__r.Total_Allotted_Hours__c,
                                Client_Program__r.Current_OHF__c, Client_Program__r.Latest_Fuel__c, Client_Program__r.Contracted_Aircraft_Type__c
                    FROM Client_Program_Year__c WHERE Id = :programPeriodIdP];

                program = programPeriod.Client_Program__r;

                BilledHours = 0;
                BilledHoursEditable = true;
                
                OwnedHoursSelection = 'Annual Hours Allotted';

                BuildConversionTable();
            }
        }
    }
    public Id legIdP { get; set; }
    public Id legIdX {
        get {
            return legIdP;
        }
        set {
            if (legIdP != null) return; // Avoid reloading the page when a change occurs
            legIdP = value;
            if (legIdP != null) {
                Leg__c leg = [SELECT Id, Original_Estimated_Billable_Time__c, Client_Program__r.Operator_Program__r.Operator__r.Name,
                                Client_Program__r.Current_MMF__c, Client_Program__r.Monthly_Lease_Fee__c, Client_Program__r.Total_Allotted_Hours__c,
                                Client_Program__r.Current_OHF__c, Client_Program__r.Latest_Fuel__c, Client_Program__r.Contracted_Aircraft_Type__c,
                                Client_Program_Year__r.Annual_Hours_Allotted__c, Client_Program__r.Annual_Hours_Contracted__c
                    FROM Leg__c WHERE Id = :legIdP];

                program = leg.Client_Program__r;
                programPeriod = leg.Client_Program_Year__r;

                BilledHours = leg.Original_Estimated_Billable_Time__c  == null ? 0 : leg.Original_Estimated_Billable_Time__c;
                BilledHoursEditable = false;

                OwnedHoursSelection = 'Annual Hours Allotted';

                BuildConversionTable();
            }
        }
    }
    
    public Client_Program__c program { get; set; }
    public Client_Program_Year__c programPeriod { get; set; }
    
    public decimal Monthly { 
        get { 
            return (program.Current_MMF__c == null ? 0 : program.Current_MMF__c) + 
                   (program.Monthly_Lease_Fee__c == null ? 0 : program.Monthly_Lease_Fee__c);
        } 
    }
    public decimal Yearly { get { return Monthly * 12; } }
    public string OwnedHoursSelection { get; set; }
    public decimal OwnedHours {
        get {
            if (OwnedHoursSelection == 'Annual Hours Allotted') {
                return programPeriod.Annual_Hours_Allotted__c;
            } else {
                return program.Annual_Hours_Contracted__c;
            }
        }
    }
    public decimal FixedPerHour { 
        get {
            if (OwnedHours == null || OwnedHours == 0)
                return 0;
            return Yearly / OwnedHours;
        }
    }
    public decimal Variable { 
        get { 
            return (program.Current_OHF__c == null ? 0 : program.Current_OHF__c) + 
                   (program.Latest_Fuel__c == null ? 0 : program.Latest_Fuel__c);
        } 
    }
    public decimal AllIn { get { return FixedPerHour + Variable; } }
    public decimal BilledHours { get; set; }
    public boolean BilledHoursEditable { get; set; }
    public decimal VariableCost { get { return Variable * BilledHours; } }
    public decimal AllInCost { get { return AllIn * BilledHours; } }
    
    // Conversion table
    public List<ConversionTableRow> ConversionTable { get; set; }
    public boolean HasConversionData { get { return ConversionTable != null && ConversionTable.size() > 0; } }
    
    public void BuildConversionTable() {
        Set<String> overridedPlanes = new Set<String>();
        Map<decimal, ConversionTableRow> tempGroupingMap = new Map<decimal, ConversionTableRow>();
        
        for (Client_Program_Conversion_Override__c ct : [SELECT To_Plane__c, Exchange_Rate__c, Do_Not_Combine__c FROM Client_Program_Conversion_Override__c 
                                                          	WHERE Program__c = :program.Id])
        {
            overridedPlanes.add(ct.To_Plane__c);
            
            if (ct.Do_Not_Combine__c == true) {
                tempGroupingMap.put(ct.Exchange_Rate__c + 1000, new ConversionTableRow(ct.To_Plane__c, ct.Exchange_Rate__c, BilledHours, AllIn, AllInCost, VariableCost));
            } else {
                if (tempGroupingMap.containsKey(ct.Exchange_Rate__c)) {
                    tempGroupingMap.get(ct.Exchange_Rate__c).title += ' <br /> ' + ct.To_Plane__c;
                } else {
                    tempGroupingMap.put(ct.Exchange_Rate__c, new ConversionTableRow(ct.To_Plane__c, ct.Exchange_Rate__c, BilledHours, AllIn, AllInCost, VariableCost));
                }
            }
        }
        
        for (Conversion_Table__mdt ct : [SELECT From_Plane__c, To_Plane__c, Exchange_Rate__c, Do_Not_Combine__c
                                         FROM Conversion_Table__mdt 
                                         WHERE Company__c = :program.Operator_Program__r.Operator__r.Name 
                                         	AND From_Plane__c = :program.Contracted_Aircraft_Type__c])
        {
            if (!overridedPlanes.contains(ct.To_Plane__c)) {
                if (ct.Do_Not_Combine__c == true) {
                    tempGroupingMap.put(ct.Exchange_Rate__c + 1000, new ConversionTableRow(ct.To_Plane__c, ct.Exchange_Rate__c, BilledHours, AllIn, AllInCost, VariableCost));
                } else {
                    if (tempGroupingMap.containsKey(ct.Exchange_Rate__c)) {
                        tempGroupingMap.get(ct.Exchange_Rate__c).title += ' <br /> ' + ct.To_Plane__c;
                    } else {
                        tempGroupingMap.put(ct.Exchange_Rate__c, new ConversionTableRow(ct.To_Plane__c, ct.Exchange_Rate__c, BilledHours, AllIn, AllInCost, VariableCost));
                    }
                }
            }
        }
        
        ConversionTable = tempGroupingMap.values();
        ConversionTable.sort();
    }

    public PageReference cancel() {
        if (legIdX != null)
            return new PageReference('/' + legIdX);
        if (programPeriodIdX != null)
            return new PageReference('/' + programPeriodIdX);
        return null;
    }
    
    public class ConversionTableRow implements Comparable {
        public string title { get; set; }
        public decimal rate { get; set; }
        public decimal hours { get; set; }
        public decimal hoursSavings { get; set; }
        public decimal varCost { get; set; }
        public decimal varSavings { get; set; }
        public decimal cost { get; set; }
        public decimal savings { get; set; }
        
        public ConversionTableRow(string title, decimal rate, decimal billedHours, decimal allIn, decimal allInCost, decimal variableCost) {
            this.title = title;
            this.rate = rate;
            this.hours = Math.round(rate * billedHours * 10) / 10.0;
            this.hoursSavings = billedHours - this.hours;
            this.varCost = this.rate * variableCost;
            this.varSavings = variableCost - this.varCost;
            this.cost = this.hours * allIn;
            this.savings = allInCost - this.cost;
        }
        
        public Integer compareTo(Object compareTo) {
            ConversionTableRow compTo = (ConversionTableRow)compareTo;
            if (this.rate < compTo.rate)
                return -1;
            if (this.rate > compTo.rate)
                return 1;
            return 0;
        }
    }

}