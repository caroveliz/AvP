/******************************************************************************************************
*******************************************************************************************************
* AviationHomePageController is Custom Controller for AviationHome Page Which opens
* from a Home page.
*
* Functionality :
* 1)AviationHomePageController fetches all the detail from opportunity,Quarterly Summary and leg data
*   Objects based on current logged in user.
*
* Revision History:
* Version         Author             Date                Description
*  1.0        Yogesh Sharma       07/18/2016            Initial Draft
*  1.1        Yogesh Sharma       09/05/2016            Changes to get contact client date
*******************************************************************************************************
********************************************************************************************************/

public without sharing class AviationHomePageController {

    //All Class level Variables and Collections.
    public Double dblAVAnnualFee                        {get;set;}
    public Date dateContractRenewelDate                 {get;set;}
    public String strMainAreaOfAVPImpact                {get;set;}
    public String strPortfolioOptimizationSuccesses     {get;set;}
    public String strAviationPortfolioRelationStatus    {get;set;}
    public String strMainAreasOfAvPFocus                {get;set;}
    public String strPortfolioOptimizationOpportunities {get;set;}
    public String strAvPRelationshipImprovementAreas    {get;set;}
    public Double dblCharterTotalSpend                  {get;set;}
    //public Double dblNetJetsTotalSpend                {get;set;}
    public Double dblCharterYTDSpend                    {get;set;}
    //public Double dblNetJetsYTDSpend                  {get;set;}
    public Double dblTotalSpentPriorYear                {get;set;}
    public Double dblTotalSpentCurrentYear              {get;set;}
    //public Double dblCharterPercentage                {get;set;}
    //public Double dblNetJetsPercentage                {get;set;}
    //public Double dblTotalPercentage                  {get;set;}
    public Integer intCurrentyear                       {get;set;}
    public Integer intPreviousyear                      {get;set;}
    public Double dblSavedForClient                     {get;set;}
    public Double dblClientROI                          {get;set;}
    public Date dateAvStartDate                         {get;set;}

    //MaxBilled hours
    public Double dblMaxBillCharterCurrent              {get;set;}
    public Double dblMaxBillCharterPrevious             {get;set;}
    //public Double dblMaxBillNetjetPrevious              {get;set;}
    public Double dblTotalBillHourCurrent               {get;set;}
    public Double dblTotalBillHourPrevios               {get;set;}

    //public Double dblMaxbillPercentageCharter           {get;set;}
    //public Double dblMaxbillPercentageTotal             {get;set;}
    //public Boolean blnTableShow                         {get;set;}
    public Double dblSumRelDollar                       {get;set;}
    public Double dblSumRelHour                         {get;set;}
    public Double dblTotalSumRelHour                    {get;set;}
    public Double dblTotalRelCal                        {get;set;}
    //All class level variables which are not used on page.
    id UserId;
    set<id> setAccountId;
    list<Opportunity>lstOpportunity;
    list<Quarterly_Summary__c> lstQuarterlySummery;
    list<AggregateResult>lstLegCurrent;
    list<AggregateResult>lstLegPrior;

    //Max billed hours
    list<AggregateResult>lstMaxbilledHoursCharterCurrent;
    list<AggregateResult>lstMaxbilledHoursCharterPrevious;
    list<AggregateResult>lstMaxbilledHoursNetJetsCurrent;
    list<AggregateResult>lstMaxbilledHoursNetJetsPrevious;
    //Date 9/29/2016 Calculation for relationship to date charter list
    list<AggregateResult>lstRelToDtCharDollar;
    list<AggregateResult>lstRelToDtCharHour;
    public string strCurrentQtr {get;set;}
    public map<String, Double> mapProg_CurYr{get;set;}
    public map<String, Double> mapProg_PreYr{get;set;}
    public map<String, Double> mapPro_Rel{get;set;}
    public map<string, map<string,Double>> mapProg_Data{get;set;}
    public set<string> setPrName{get;set;}
    public string strCur{get;set;}
    public string strPrev{get;set;}
    public integer intMapSizeCur{get;set;}
    public integer intMapSizePre{get;set;}
    public integer intMapSizeRel{get;set;}
    public integer intMapsizeData{get;set;}
    Double dblTotalCurPrgm;
    Double dblTotalPrePrgm;
    Double dblTotalRelPrgm;
    public double dblAccHours{get;set;}

    //variable for FlowanHours
    public map<String, Double> mapProg_CurYr_HR{get;set;}
    public map<String, Double> mapProg_PreYr_HR{get;set;}
    public map<String, Double> mapPro_Rel_HR{get;set;}
    public map<string, map<string,Double>> mapProg_Data_HR{get;set;}
    public integer intMapSizeCur_HR{get;set;}
    public integer intMapSizePre_HR{get;set;}
    public integer intMapSizeRel_HR{get;set;}
    public integer intMapsizeData_HR{get;set;}
    Double dblTotalCurPrgm_HR;
    Double dblTotalPrePrgm_HR;
    Double dblTotalRelPrgm_HR;
    //AviationHomePageController Contructor initalise all the variable and fetch the currnet user Id.
    public AviationHomePageController(){
        intMapSizeCur=0;
        intMapSizePre= 0;
        intMapSizeRel=0;
        intMapsizeData = 0;
        intMapSizeCur_HR=0;
        intMapSizePre_HR= 0;
        intMapSizeRel_HR=0;
        intMapsizeData_HR = 0;
        dblTotalSumRelHour=0.0;
        //blnTableShow=false;
        dblAccHours=0.0;
        dblTotalCurPrgm_HR=0.0;
        dblTotalPrePrgm_HR=0.0;
        dblTotalRelPrgm_HR=0.0;
        dblSumRelHour= 0.0;
        dblTotalRelPrgm= 0.0;
        mapProg_CurYr= new map<String, Double> ();
        mapProg_PreYr= new map<String, Double> ();
        mapPro_Rel= new map<String, Double> ();
        mapProg_Data= new map<string, map<string,Double>>();
        setPrName= new set<String>();
        mapProg_CurYr_HR= new map<String, Double> ();
        mapProg_PreYr_HR= new map<String, Double> ();
        mapPro_Rel_HR= new map<String, Double> ();
        mapProg_Data_HR= new map<string, map<string,Double>>();
        UserId = UserInfo.getUserId();
        intCurrentyear = date.today().year();
        intPreviousyear = intCurrentyear-1;
        dblAVAnnualFee = 0.0;
        dblSumRelDollar=0.0;
        dblTotalCurPrgm=0.0;
        dblCharterTotalSpend = 0.0;
        dblTotalRelCal= 0.0;
        //dblNetJetsTotalSpend = 0.0;
        dblCharterYTDSpend = 0.0;
        //dblNetJetsYTDSpend = 0.0;
        dblTotalSpentPriorYear = 0.0;
        dblTotalSpentCurrentYear = 0.0;
        //dblCharterPercentage = 0.0;
        //dblNetJetsPercentage = 0.0;
        //dblTotalPercentage = 0.0;
        dblSavedForClient = 0.0;
        dblClientROI = 0.0;
        dblTotalCurPrgm=0.0;
        dblMaxBillCharterCurrent = 0.0;
        dblMaxBillCharterPrevious = 0.0;
        //dblMaxBillNetjetPrevious = 0.0;
        dblTotalBillHourCurrent = 0.0;
        dblTotalBillHourPrevios= 0.0;
        //dblMaxbillPercentageCharter = 0.0;
        //dblMaxbillPercentageTotal = 0.0;
        dblTotalPrePrgm= 0.0;
        strMainAreaOfAVPImpact='';
        strPortfolioOptimizationSuccesses='';
        strAviationPortfolioRelationStatus='';
        strMainAreasOfAvPFocus='';
        strPortfolioOptimizationOpportunities='';
        strAvPRelationshipImprovementAreas='';
        fetchData();
    }//End of AviationHomePageController constructor


    //Fetch all the data for current logged in community user from opportunity,Account
    //contact,leg__c and Quarterly_Summary__c objects and displays on the page
    public void fetchData(){

        lstOpportunity = new list<Opportunity>();
        setAccountId = new set<id>();
        lstQuarterlySummery = new list<Quarterly_Summary__c>();
        lstLegCurrent = new list<AggregateResult>();
        lstLegPrior = new list<AggregateResult>();

        //Max billed hour
        lstMaxbilledHoursCharterCurrent = new list<AggregateResult>();
        lstMaxbilledHoursCharterPrevious = new list<AggregateResult>();
        lstMaxbilledHoursNetJetsCurrent = new list<AggregateResult>();
        lstMaxbilledHoursNetJetsPrevious = new list<AggregateResult>();

        list<user>lstUser;
		
        Id contactId = ApexPages.currentPage().getParameters().get('CID');
        if(contactId != NULL){
            //Fetch contact and account info for the current Contact
            for(Contact objContact :[SELECT id,
                                      accountId,
                                      Client_Start_Date__c
                                 FROM Contact
                                WHERE id =:contactId]){
                if(objContact.Client_Start_Date__c <> NULL)
                    dateAvStartDate= objContact.Client_Start_Date__c;
                if(objContact.accountId != null){
                    setAccountId.add(objContact.accountId);
                }
            }            
        }
        else if(UserId!=null){
            //Fetch contact and account id for currnt logged in community user
            for(User objUser :[SELECT id,
                                      contactId,
                                      contact.accountId,
                                      contact.Client_Start_Date__c
                                 FROM user
                                WHERE isPortalEnabled = true And id =:UserId]){
                if(objUser.contact.Client_Start_Date__c <> NULL)
                    dateAvStartDate= objUser.contact.Client_Start_Date__c;
                if(objUser.contact.accountId != null){
                    setAccountId.add(objUser.contact.accountId);
                }
            }
        }//End of If/else if
        if(setAccountId!= null && !setAccountId.isEmpty()){
            //fetch opportunity details associated with the account of currnt logged in community user
            lstOpportunity = [SELECT id,
                                     Amount,
                                     CloseDate
                                FROM Opportunity
                               WHERE AccountId IN: setAccountId
                                 AND StageName =: System.Label.Closed_Won
                               ORDER BY LastModifiedDate DESC];

            //fetch fiscal year hours Account

                   for(AggregateResult objTime: [SELECT sum(Hours__c)
                                                   FROM Time__c
                                                  WHERE Account__c IN: setAccountId]){
                        if(Double.valueOf(objTime.get('expr0')) <> NULL){
                        dblAccHours = Double.valueOf(objTime.get('expr0'));
                        }
                        else{
                            dblAccHours=0.0;
                        }
                    }// end for

            //Fetch sum of cvp saving on client value proposition associated with account of current looged in comminity user
            if(setAccountId!= null && !setAccountId.isEmpty()){
                list<AggregateResult> lstClientValue = [SELECT SUM(CVP_Savings__c)
                                                          From Client_Value_Proposition_del__c
                                                         WHERE Account__c IN: setAccountId];
                if(!lstClientValue.isEmpty() && lstClientValue!= null){
                    if(Double.valueOf(lstClientValue[0].get('expr0')) != null){
                        dblSavedForClient = Decimal.valueOf(Double.valueOf(lstClientValue[0].get('expr0'))).setScale(2);
                    }
                }// end if

            //Fertch sum of all opportunity amount where stagename = closed Won releted to account of curent logged in community user.
            list<AggregateResult> lstOpportunityAmount=[SELECT sum(amount)
                                                          FROM Opportunity
                                                          WHERE StageName =: System.Label.Closed_Won
                                                            AND AccountId IN: setAccountId];
            if(!lstOpportunityAmount.isEmpty() && lstOpportunityAmount!= null){
                if(Double.valueOf(lstOpportunityAmount[0].get('expr0')) != null){
                    Double temp = Double.valueOf(lstOpportunityAmount[0].get('expr0'));
                    if(dblSavedForClient!=0.0){
                        dblClientROI = Decimal.valueOf(((dblSavedForClient / temp)*100)).setScale(2);
                    }
                }
            }
            //fetch recent quarterly summery details associated with account of currnt logged in community user
            lstQuarterlySummery =[SELECT id,
                                         Portfolio_Optimization_Opportunities__c,
                                         Main_Areas_of_AvP_Impact_to_Client__c,
                                         Main_Areas_of_AvP_Focus__c,
                                         Aviation_Portfolio_Relationship_Status__c,
                                         Quarter__c
                                    FROM Quarterly_Summary__c Where Client__c IN :setAccountId
                                   order by LastModifiedDate desc limit 1];
            strCur = string.valueof(intCurrentyear);
            strPrev=string.valueof(intCurrentyear-1);
            //fetch all leg infromation associated with account for Current Year where category in charter
            //or non-guranteed
            lstLegCurrent =[SELECT sum(Total_Flight_Cost__c)
                              FROM Leg__c
                             WHERE Solution_Category__c =:System.Label.Non_Guaranteed_Charter
                               AND Account_Name__c IN :setAccountId
                               AND CALENDAR_YEAR(Departure_Date__c) =: intCurrentyear
                               AND (Status__c =: system.label.Label_Reconciled
                               OR (Refund__c !=: null
                               AND Status__c =: system.Label.Label_Cancelled))];
            //fetch all leg infromation associated with account for Prior Year where category in charter
            //or non-guranteed
            lstLegPrior = [SELECT sum(Total_Flight_Cost__c)
                               FROM Leg__c
                              WHERE Solution_Category__c =:System.Label.Non_Guaranteed_Charter
                                AND Account_Name__c  IN :setAccountId
                                AND CALENDAR_YEAR(Departure_Date__c) =: intCurrentyear-1
                                AND (Status__c =: system.label.Label_Reconciled
                                OR (Refund__c !=: null
                                AND Status__c =: system.Label.Label_Cancelled))];
            //fetch all leg infromation associated with account for Prior Year where category not in charter
            //or non-guranteed --->lstLegNetJetsCurrent
             //fetch set Program associated with logged in Account setPrName
             for(Client_Program__c objProgram: [SELECT Program_Name__c
                                                 FROM Client_Program__c
                                                 WHERE Account__c IN:setAccountId]){
                if(objProgram.Program_Name__c <> NULL
                && String.isNotBlank(objProgram.Program_Name__c)) {
                    setPrName.add(objProgram.Program_Name__c);
                }
             }
             for(AggregateResult objLeg: [SELECT Client_Program__r.Program_Name__c,
                                                sum(Total_Flight_Cost__c),Client_Program_Year__c
                                           FROM Leg__c
                                          WHERE Solution_Category__c != :System.Label.Non_Guaranteed_Charter
                                            AND  Account_Name__c IN :setAccountId
                                            AND CALENDAR_YEAR(Departure_Date__c) =: intCurrentyear
                                            AND (Status__c =: system.label.Label_Reconciled
                                            OR (Refund__c !=: null
                                            AND Status__c =: system.Label.Label_Cancelled))
                                            AND (RecordType.Name=:system.Label.Label_Expense
                                            OR RecordType.Name=:system.label.Label_Leg)
                                            Group By Client_Program__r.Program_Name__c,Client_Program_Year__c]){
                if(string.valueof(objLeg.get('Program_Name__c')) <> NULL
                && string.isNotEmpty(string.valueof(objLeg.get('Program_Name__c')))){
                    if(string.valueof(objLeg.get('Client_Program_Year__c')) == NULL
                    && string.isBlank(string.valueof(objLeg.get('Client_Program_Year__c')))){
                        mapProg_CurYr.put(string.valueof(objLeg.get('Program_Name__c')),0.0);
                         dblTotalCurPrgm+=0.0;
                    }
                    else{
                        mapProg_CurYr.put(string.valueof(objLeg.get('Program_Name__c')),double.valueof(objLeg.get('expr0')));
                         dblTotalCurPrgm+=double.valueof(objLeg.get('expr0'));
                    }
                        setPrName.add(string.valueof(objLeg.get('Program_Name__c')));
                        mapProg_Data.put(string.valueof(intCurrentyear),mapProg_CurYr);
                }
            }

            //fetch all leg infromation associated with account for Prior Year where category not in charter
            //or non-guranteed --->lstLegNetJetsCurrent lstLegNetJetsPrior
             for(AggregateResult objLeg: [SELECT Client_Program__r.Program_Name__c,
                                                sum(Total_Flight_Cost__c),Client_Program_Year__c
                                           FROM Leg__c
                                          WHERE Solution_Category__c != :System.Label.Non_Guaranteed_Charter
                                            AND Account_Name__c IN :setAccountId
                                            AND CALENDAR_YEAR(Departure_Date__c) =: intCurrentyear -1
                                            AND (Status__c =: system.label.Label_Reconciled
                                            OR (Refund__c !=: null
                                            AND Status__c =: system.Label.Label_Cancelled))
                                            AND (RecordType.Name=:system.Label.Label_Expense
                                            OR RecordType.Name=:system.label.Label_Leg)
                                            Group By Client_Program__r.Program_Name__c,Client_Program_Year__c]){
                if(string.valueof(objLeg.get('Program_Name__c')) <> NULL
                && string.isNotEmpty(string.valueof(objLeg.get('Program_Name__c')))){
                    if(string.valueof(objLeg.get('Client_Program_Year__c')) == NULL
                    && string.isBlank(string.valueof(objLeg.get('Client_Program_Year__c')))){
                        mapProg_PreYr.put(string.valueof(objLeg.get('Program_Name__c')),0.0);
                        dblTotalPrePrgm+=0.0;
                    }
                    else{
                        mapProg_PreYr.put(string.valueof(objLeg.get('Program_Name__c')),double.valueof(objLeg.get('expr0')));
                        dblTotalPrePrgm+=double.valueof(objLeg.get('expr0'));
                    }
                        setPrName.add(string.valueof(objLeg.get('Program_Name__c')));
                        mapProg_Data.put(string.valueof(intCurrentyear -1),mapProg_PreYr);
                }
            }//end for

            //fetch for charter relationship to date
             for(AggregateResult objLeg: [SELECT Client_Program__r.Program_Name__c,
                                                sum(Total_Flight_Cost__c),Client_Program_Year__c
                                           FROM Leg__c
                                          WHERE Solution_Category__c != :System.Label.Non_Guaranteed_Charter
                                            AND  Account_Name__c IN :setAccountId
                                            AND (Status__c =: system.label.Label_Reconciled
                                            OR (Refund__c !=: null
                                            AND Status__c =: system.Label.Label_Cancelled))
                                            AND (RecordType.Name=:system.Label.Label_Expense
                                            OR RecordType.Name=:system.label.Label_Leg)
                                            Group By Client_Program__r.Program_Name__c,Client_Program_Year__c]){

                    if(string.valueof(objLeg.get('Program_Name__c')) <> NULL
                && string.isNotEmpty(string.valueof(objLeg.get('Program_Name__c')))){
                    if(string.valueof(objLeg.get('Client_Program_Year__c')) == NULL
                    && string.isBlank(string.valueof(objLeg.get('Client_Program_Year__c')))){
                        mapPro_Rel.put(string.valueof(objLeg.get('Program_Name__c')),0.0);
                         dblTotalRelPrgm+=0.0;
                    }
                    else{
                        mapPro_Rel.put(string.valueof(objLeg.get('Program_Name__c')),double.valueof(objLeg.get('expr0')));
                         dblTotalRelPrgm+=double.valueof(objLeg.get('expr0'));
                    }
                        setPrName.add(string.valueof(objLeg.get('Program_Name__c')));
                        mapProg_Data.put(system.label.Relationship_Date,mapPro_Rel);

                }
            }//end for mapPro_Rel
            intMapSizeCur = mapProg_CurYr.size();
            intMapSizePre= mapProg_PreYr.size();
            intMapSizeRel= mapPro_Rel.size();
            intMapsizeData= mapProg_Data.size();

            if(setPrName <> NULL && !setPrName.isEmpty()){
                //fetchDollarData(mapPro_Rel, mapProg_PreYr, mapProg_CurYr, setPrName);
                fetchDollarDataFrmMapPrgm(mapProg_Data, setPrName);
            }// end if

           //fetch  sum of all Max_Billed_Flight_Time__c associated with account for Prior Year where
           //category  in charter or non-guranteed
           lstMaxbilledHoursCharterCurrent =[SELECT sum(Max_Billed_Flight_Time__c)
                                               FROM Leg__c
                                              WHERE Solution_Category__c = :System.Label.Non_Guaranteed_Charter
                                                AND Account_Name__c  IN :setAccountId
                                                AND CALENDAR_YEAR(Departure_Date__c) =: intCurrentyear
                                                AND (Status__c =: system.label.Label_Reconciled
                                                OR (Refund__c !=: null
                                                AND Status__c =: system.Label.Label_Cancelled))];


            if(!lstMaxbilledHoursCharterCurrent.isEmpty() && lstMaxbilledHoursCharterCurrent!= null){
                if(Double.valueOf(lstMaxbilledHoursCharterCurrent[0].get('expr0')) != null){
                    dblMaxBillCharterCurrent = Decimal.valueOf(Double.valueOf(lstMaxbilledHoursCharterCurrent[0].get('expr0'))).setScale(0);
                }
            }

            //fetch  sum of all Max_Billed_Flight_Time__c associated with account for prior Year where
            //category  in charter or non-guranteed
           lstMaxbilledHoursCharterPrevious =[SELECT sum(Max_Billed_Flight_Time__c)
                                               FROM Leg__c
                                              WHERE Solution_Category__c = :System.Label.Non_Guaranteed_Charter
                                                AND Account_Name__c  IN :setAccountId
                                                AND CALENDAR_YEAR(Departure_Date__c) =: intCurrentyear-1
                                                AND (Status__c =: system.label.Label_Reconciled
                                                OR (Refund__c !=: null
                                                AND Status__c =: system.Label.Label_Cancelled))];

            if(!lstMaxbilledHoursCharterPrevious.isEmpty() && lstMaxbilledHoursCharterPrevious!= null){
                if(Double.valueOf(lstMaxbilledHoursCharterPrevious[0].get('expr0')) != null){
                    dblMaxBillCharterPrevious = Decimal.valueOf(Double.valueOf(lstMaxbilledHoursCharterPrevious[0].get('expr0'))).setScale(0);
                }
            }
            //fetch  sum of all Max_Billed_Flight_Time__c associated with account for all Year where
            //category not in charter or non-guranteed lstMaxbilledHoursNetJetsCurrent
            for(AggregateResult objLeg : [SELECT Client_Program__r.Program_Name__c,
                                                   sum(Max_Billed_Flight_Time__c),Client_Program_Year__c
                                              FROM Leg__c
                                             WHERE Solution_Category__c != :System.Label.Non_Guaranteed_Charter
                                              AND Account_Name__c  IN :setAccountId                                          
                                               AND (Status__c =: system.label.Label_Reconciled
                                                OR (Refund__c !=: null
                                                AND Status__c =: system.Label.Label_Cancelled))
                                                AND (RecordType.Name=:system.Label.Label_Expense
                                                OR RecordType.Name=:system.label.Label_Leg)
                                               GROUP BY Client_Program__r.Program_Name__c, Client_Program_Year__c]){

                if(string.valueof(objLeg.get('Program_Name__c')) <> NULL
                && string.isNotEmpty(string.valueof(objLeg.get('Program_Name__c')))){
                    if(string.valueof(objLeg.get('Client_Program_Year__c')) == NULL
                    && string.isBlank(string.valueof(objLeg.get('Client_Program_Year__c')))){
                        mapPro_Rel_HR.put(string.valueof(objLeg.get('Program_Name__c')),0.0);
                         dblTotalRelPrgm_HR+=0.0;
                    }
                    else{
                        mapPro_Rel_HR.put(string.valueof(objLeg.get('Program_Name__c')),double.valueof(objLeg.get('expr0')));
                         dblTotalRelPrgm_HR+=double.valueof(objLeg.get('expr0'));
                    }
                        setPrName.add(string.valueof(objLeg.get('Program_Name__c')));
                        mapProg_Data_HR.put(system.label.Relationship_Date,mapPro_Rel_HR);
                }
            }// end for

            //fetch  sum of all Max_Billed_Flight_Time__c associated with account for Prior Year where
            //category not in charter or non-guranteed
           for(AggregateResult objLeg: [SELECT Client_Program__r.Program_Name__c,
                                                sum(Max_Billed_Flight_Time__c),Client_Program_Year__c
                                           FROM Leg__c
                                          WHERE Solution_Category__c != :System.Label.Non_Guaranteed_Charter
                                            AND Account_Name__c IN :setAccountId
                                           
                                            AND CALENDAR_YEAR(Departure_Date__c) =: intCurrentyear -1
                                            AND (Status__c =: system.label.Label_Reconciled
                                            OR (Refund__c !=: null
                                            AND Status__c =: system.Label.Label_Cancelled))
                                            AND (RecordType.Name=:system.Label.Label_Expense
                                            OR RecordType.Name=:system.label.Label_Leg)
                                            Group By Client_Program__r.Program_Name__c, Client_Program_Year__c]){

                if(string.valueof(objLeg.get('Program_Name__c')) <> NULL
                && string.isNotEmpty(string.valueof(objLeg.get('Program_Name__c')))){
                    if(string.valueof(objLeg.get('Client_Program_Year__c')) == NULL
                    && string.isBlank(string.valueof(objLeg.get('Client_Program_Year__c')))){
                        mapProg_PreYr_HR.put(string.valueof(objLeg.get('Program_Name__c')),0.0);
                         dblTotalPrePrgm_HR+=0.0;
                    }
                    else{
                        mapProg_PreYr_HR.put(string.valueof(objLeg.get('Program_Name__c')),double.valueof(objLeg.get('expr0')));
                         dblTotalPrePrgm_HR+=double.valueof(objLeg.get('expr0'));
                    }
                        setPrName.add(string.valueof(objLeg.get('Program_Name__c')));
                        mapProg_Data_HR.put(string.valueof(intCurrentyear -1),mapProg_PreYr_HR);
                }
            }//end for
            //cuurent year
            for(AggregateResult objLeg: [SELECT Client_Program__r.Program_Name__c,
                                                sum(Max_Billed_Flight_Time__c),Client_Program_Year__c
                                           FROM Leg__c
                                          WHERE Solution_Category__c != :System.Label.Non_Guaranteed_Charter
                                            AND Account_Name__c IN :setAccountId
                                           
                                            AND CALENDAR_YEAR(Departure_Date__c) =: intCurrentyear
                                            AND (Status__c =: system.label.Label_Reconciled
                                            OR (Refund__c !=: null
                                            AND Status__c =: system.Label.Label_Cancelled))
                                            AND (RecordType.Name=:system.Label.Label_Expense
                                            OR RecordType.Name=:system.label.Label_Leg)
                                            Group By Client_Program__r.Program_Name__c, Client_Program_Year__c]){

                if(string.valueof(objLeg.get('Program_Name__c')) <> NULL
                && string.isNotEmpty(string.valueof(objLeg.get('Program_Name__c')))){
                    if(string.valueof(objLeg.get('Client_Program_Year__c')) == NULL
                    && string.isBlank(string.valueof(objLeg.get('Client_Program_Year__c')))){
                        mapProg_CurYr_HR.put(string.valueof(objLeg.get('Program_Name__c')),0.0);
                         dblTotalCurPrgm_HR+=0.0;
                    }
                    else{
                        mapProg_CurYr_HR.put(string.valueof(objLeg.get('Program_Name__c')),double.valueof(objLeg.get('expr0')));
                         dblTotalCurPrgm_HR+=double.valueof(objLeg.get('expr0'));
                    }
                        setPrName.add(string.valueof(objLeg.get('Program_Name__c')));
                        mapProg_Data_HR.put(string.valueof(intCurrentyear),mapProg_CurYr_HR);
                }
            }//end for
            intMapSizeCur_HR = mapProg_CurYr_HR.size();
            intMapSizePre_HR= mapProg_PreYr_HR.size();
            intMapSizeRel_HR= mapPro_Rel_HR.size();
            intMapsizeData_HR= mapProg_Data_HR.size();
            if(setPrName <> NULL && !setPrName.isEmpty()){
                //fetchDollarData(mapPro_Rel, mapProg_PreYr, mapProg_CurYr, setPrName);
                fetchHoursDataFrmMapPrgm(mapProg_Data_HR, setPrName);
            }// end if
            //fetch relationship to date's sum of Total flight cost of charter and non Guaranteed soln
            lstRelToDtCharDollar = [SELECT sum(Total_Flight_Cost__c)
                                      FROM Leg__c
                                     WHERE Solution_Category__c = :System.Label.Non_Guaranteed_Charter
                                       AND Account_Name__c  IN :setAccountId
                                       AND (Status__c =: system.label.Label_Reconciled
                                        OR (Refund__c !=: null
                                        AND Status__c =: system.Label.Label_Cancelled))];
            if(lstRelToDtCharDollar <> NULL && !lstRelToDtCharDollar.isEmpty()){
                if(Double.valueOf(lstRelToDtCharDollar[0].get('expr0')) != null){
                   dblSumRelDollar =  Decimal.valueOf(Double.valueOf(lstRelToDtCharDollar[0].get('expr0'))).setScale(2);
                }//end if
            }// end if
            //fetch relationship to date's sum of max billed codt of charter and non Guaranteed soln
            lstRelToDtCharHour = [SELECT sum(Max_Billed_Flight_Time__c)
                                    FROM Leg__c
                                   WHERE Solution_Category__c = :System.Label.Non_Guaranteed_Charter
                                     AND Account_Name__c  IN :setAccountId
                                     AND (Status__c =: system.label.Label_Reconciled
                                     OR (Refund__c !=: null
                                     AND Status__c =: system.Label.Label_Cancelled))];
            if(lstRelToDtCharHour <> NULL && !lstRelToDtCharHour.isEmpty()){
                if(Double.valueOf(lstRelToDtCharHour[0].get('expr0')) != null){
                   dblSumRelHour =  Decimal.valueOf(Double.valueOf(lstRelToDtCharHour[0].get('expr0'))).setScale(0);
                }//end if
            }// end if
        }
        }//end if Account Id not Null
        if(lstOpportunity!= null && !lstOpportunity.isEmpty()){
            //set values to AVAnnualFee and ContractRenewelDate
            dblAVAnnualFee = lstOpportunity[0].Amount;
            dateContractRenewelDate = lstOpportunity[0].CloseDate;
        }
        if(lstQuarterlySummery!=null && !lstQuarterlySummery.isEmpty()){
            if(lstQuarterlySummery[0].Main_Areas_of_AvP_Impact_to_Client__c!= null &&
             !String.isEmpty(lstQuarterlySummery[0].Main_Areas_of_AvP_Impact_to_Client__c)){
                //Assign value to strMainAreaOfAVPImpact
                strMainAreaOfAVPImpact = lstQuarterlySummery[0].Main_Areas_of_AvP_Impact_to_Client__c;
            }
            /*if(lstQuarterlySummery[0].Portfolio_Optimization_Successes__c!= null &&
             !String.isEmpty(lstQuarterlySummery[0].Portfolio_Optimization_Successes__c)){
                //Assign value to strPortfolioOptimizationSuccesses
                strPortfolioOptimizationSuccesses = lstQuarterlySummery[0].Portfolio_Optimization_Successes__c;
                system.debug(strPortfolioOptimizationSuccesses);
            }*/ // updated 9/29/2016 to populate Quarter
            if(lstQuarterlySummery[0].Quarter__c!= null &&
             !String.isEmpty(lstQuarterlySummery[0].Quarter__c)) {
                strCurrentQtr = lstQuarterlySummery[0].Quarter__c;
            }// end if
            if(lstQuarterlySummery[0].Aviation_Portfolio_Relationship_Status__c!= null &&
             !String.isEmpty(lstQuarterlySummery[0].Aviation_Portfolio_Relationship_Status__c)){
                //Assign value to strAviationPortfolioRelationStatus
                strAviationPortfolioRelationStatus = lstQuarterlySummery[0].Aviation_Portfolio_Relationship_Status__c;
            }
            if(lstQuarterlySummery[0].Main_Areas_of_AvP_Focus__c!= null &&
             !String.isEmpty(lstQuarterlySummery[0].Main_Areas_of_AvP_Focus__c)){
                //Assign value to strMainAreasOfAvPFocus
                strMainAreasOfAvPFocus = lstQuarterlySummery[0].Main_Areas_of_AvP_Focus__c;
            }
            if(lstQuarterlySummery[0].Portfolio_Optimization_Opportunities__c!= null &&
             !String.isEmpty(lstQuarterlySummery[0].Portfolio_Optimization_Opportunities__c)){
                //Assign value to strPortfolioOptimizationOpportunities
                strPortfolioOptimizationOpportunities = lstQuarterlySummery[0].Portfolio_Optimization_Opportunities__c;
            }
            /*if(lstQuarterlySummery[0].AvP_Relationship_Improvement_Areas__c!= null &&
             !String.isEmpty(lstQuarterlySummery[0].AvP_Relationship_Improvement_Areas__c)){
                //Assign value to strAvPRelationshipImprovementAreas
                strAvPRelationshipImprovementAreas = lstQuarterlySummery[0].AvP_Relationship_Improvement_Areas__c;
                system.debug(strAvPRelationshipImprovementAreas);
            }*/
        }//End of Outer If

        if(!lstLegCurrent.isEmpty() && lstLegCurrent!= null){
            if(Double.valueOf(lstLegCurrent[0].get('expr0')) != null){
                dblCharterYTDSpend = Decimal.valueOf(Double.valueOf(lstLegCurrent[0].get('expr0'))).setScale(2);
               //
            }
        }//End of If
        if(!lstLegPrior.isEmpty() && lstLegPrior!= null){
            if(Double.valueOf(lstLegPrior[0].get('expr0')) != null){
               dblCharterTotalSpend = Decimal.valueOf(Double.valueOf(lstLegPrior[0].get('expr0'))).setScale(2);
            }
        }//End of If

        dblTotalSpentPriorYear = Decimal.valueOf(dblCharterTotalSpend + dblTotalPrePrgm).setScale(2);
        dblTotalSpentCurrentYear = Decimal.valueOf(dblCharterYTDSpend + dblTotalCurPrgm).setScale(2);
        dblTotalRelCal =  Decimal.valueOf(dblTotalRelPrgm + dblSumRelDollar).setScale(0);

        dblTotalSumRelHour = Decimal.valueOf(dblTotalRelPrgm_HR + dblSumRelHour).setScale(0);
        dblTotalBillHourCurrent = Decimal.valueOf(dblMaxBillCharterCurrent + dblTotalCurPrgm_HR).setScale(0);
        dblTotalBillHourPrevios = Decimal.valueOf(dblMaxBillCharterPrevious + dblTotalPrePrgm_HR).setScale(0);
    }//End of fetchData

    //method to fetch Dollar table
    public void fetchDollarDataFrmMapPrgm(map<String,map<String,double>> mapProg_Data, set<String> setPrName){
        for(map<String,double> mapProgram: mapProg_Data.values()){
            for(String strPrName: setPrName){
                if(!mapProgram.containsKey(strPrName)){
                    mapProgram.put(strPrName,0.0);
                }
            }//end for
        }//
    }// end method

    //method to fetch Hours table
    public void fetchHoursDataFrmMapPrgm(map<String,map<String,double>> mapProg_Data_HR, set<String> setPrName_HR){
        for(map<String,double> mapProgram: mapProg_Data_HR.values()){
            for(String strPrName: setPrName_HR){
                if(!mapProgram.containsKey(strPrName)){
                    mapProgram.put(strPrName,0.0);
                }
            }//end for
        }//
    }// end method

}//End of AviationHomePageController