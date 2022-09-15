@isTest (SeeAllData=true)
private class TestClient_Program_YearProcessTrigger { 
    private static testMethod void Test_Client_Program_YearProcessTrigger () { 
        try{
            Client_Program_Year__c fw = new Client_Program_Year__c(); 
            insert fw; 
            System.assertNotEquals(null, fw.id); 
            update fw; 
            delete fw;
        } catch(Exception e){
            FSTR.COTestFactory.FillAllFields=true;
            Client_Program_Year__c fw = (Client_Program_Year__c)FSTR.COTestFactory.createSObject('Client_Program_Year__c',true); 
            insert fw; 
            System.assertNotEquals(null, fw.id); 
            update fw; 
            delete fw;
        }
    } 
}