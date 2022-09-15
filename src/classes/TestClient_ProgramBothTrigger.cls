@isTest (SeeAllData=true)
private class TestClient_ProgramBothTrigger { 
    private static testMethod void Test_Client_ProgramBothTrigger () { 
        try{
            Client_Program__c fw = new Client_Program__c(); 
            insert fw; 
            System.assertNotEquals(null, fw.id); 
            update fw; 
            delete fw;
        } catch(Exception e){
            FSTR.COTestFactory.FillAllFields=true;
            Client_Program__c fw = (Client_Program__c)FSTR.COTestFactory.createSObject('Client_Program__c',true); 
            insert fw; 
            System.assertNotEquals(null, fw.id); 
            update fw; 
            delete fw;
        }
    } 
}