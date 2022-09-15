public with sharing class TripManagerCtlr {
    
    ApexPages.StandardController controller;    
    public Date dReq { get { return Date.today(); } set;}
    public String  subj {get;set;}
    public String  des {get;set;}
    public String  timeSensitive {get;set;}
    public Integer  flihtBdgt {get;set;}
    public Integer  maxPass {get;set;}
    public Integer  adltPass {get;set;}
    public Integer  chldPass     {get;set;}
    public Integer  lapBabies {get;set;}
    public Integer  pets {get;set;}
    public String  spclLugg {get;set;}
    public String  spclTripNotes {get;set;}
    public String  cFlightDetails {get;set;}
    public String trTypes {get;set;}
    public String arTypes {get;set;}
    public String nonStopReq {get;set;}
    public String wifiReq {get;set;}
    public String pTrip {get;set;}
    public String travelTime {get;set;}
    public String ccFlight {get;set;}
    public String pTripOthr {get;set;}
    public Case c ;
    PageReference pageRef;

    public TripManagerCtlr(ApexPages.StandardController con){
         controller = con;
    } 
    
    public PageReference saveRecord() {

        try{
            c = new Case();
            c.Date_Requested__c = dReq;
            c.Subject = subj;
            c.Description = des;
            c.Time_Sensitive_Event_Description__c = timeSensitive;
            c.Flight_Budget__c = flihtBdgt;
            c.Max_of_Passengers__c = maxPass;
            c.of_Adult_Passengers__c = adltPass;
            c.of_Child_Passengers__c = chldPass;
            c.of_Lap_Babies__c = lapBabies;
            c.of_Pets__c = pets;
            c.Special_Luggage__c = spclLugg;
            c.Special_Trip_Request_Notes__c = spclTripNotes;
            c.Commercial_Flight_Details__c = cFlightDetails;
            if(trTypes == 'None')
               c.Trip_Type__c = ' ';
            else
               c.Trip_Type__c = trTypes;
            if(arTypes == 'None')
               c.Aircraft_Type_Requested__c = ' '; 
            else     
               c.Aircraft_Type_Requested__c=arTypes;
            if(nonStopReq == 'None')
               c.Non_Stop_Required__c = ' '; 
            else   
               c.Non_Stop_Required__c =nonStopReq;
            if(wifiReq == 'None')
               c.WiFi_Required__c = ' '; 
            else    
               c.WiFi_Required__c = wifiReq;
            if(pTrip == 'None')
               c.Purpose_of_Trip__c = ' '; 
            else     
               c.Purpose_of_Trip__c = pTrip;
            //if(pTrip == 'Other')
              c.Purpose_of_Trip_if_Other__c = pTripOthr;

            if(travelTime == 'None')
               c.Travel_to_a_Time_Sensitive_Event__c = ' '; 
            else    
               c.Travel_to_a_Time_Sensitive_Event__c =travelTime;
            if(ccFlight == 'None')
               c.Connecting_To_From_Commercial_Flight__c = ' '; 
            else    
               c.Connecting_To_From_Commercial_Flight__c = ccFlight;
            insert c;
        }
        catch(Exception e){         

            ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.INFO, e.getMessage());
            ApexPages.addMessage(errMsg);           
            return null;
        }       

       pageRef = new PageReference('/500/o');
       pageRef.setRedirect(true);
       return pageRef;
    }
    public List<SelectOption> getTripTypes() {
        List<SelectOption> options = new List<SelectOption>();

        Schema.DescribeFieldResult fieldResult = Case.Trip_Type__c.getDescribe();       
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        options.add(new SelectOption('None','--None--'));   
       
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }
        return options;
    }


    public List<SelectOption> getAirTypes() {
        List<SelectOption> options = new List<SelectOption>();

        Schema.DescribeFieldResult fieldResult = Case.Aircraft_Type_Requested__c.getDescribe();         
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        options.add(new SelectOption('None','--None--'));
       
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }
        return options;
    }

    public List<SelectOption> getNonStopReqTypes() {
        List<SelectOption> options = new List<SelectOption>();

        Schema.DescribeFieldResult fieldResult = Case.Non_Stop_Required__c.getDescribe();       
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        options.add(new SelectOption('None','--None--'));
       
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }
        return options;
    }

    public List<SelectOption> getWifiReqTypes() {
        List<SelectOption> options = new List<SelectOption>();

        Schema.DescribeFieldResult fieldResult = Case.WiFi_Required__c.getDescribe();       
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        options.add(new SelectOption('None','--None--'));
       
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }
        return options;
    }

    public List<SelectOption> getPTripTypes() {
        List<SelectOption> options = new List<SelectOption>();

        Schema.DescribeFieldResult fieldResult = Case.Purpose_of_Trip__c.getDescribe();         
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        options.add(new SelectOption('None','--None--'));
       
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }
        return options;
    }

    public List<SelectOption> getTravelTimeTypes() {
        List<SelectOption> options = new List<SelectOption>();

        Schema.DescribeFieldResult fieldResult = Case.Travel_to_a_Time_Sensitive_Event__c.getDescribe();        
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        options.add(new SelectOption('None','--None--'));
       
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }
        return options;
    }

    public List<SelectOption> getCCFlightTypes() {
        List<SelectOption> options = new List<SelectOption>();

        Schema.DescribeFieldResult fieldResult = Case.Connecting_To_From_Commercial_Flight__c.getDescribe();        
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        options.add(new SelectOption('None','--None--'));
       
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }
        return options;
    }

}