@isTest (SeeAllData=true)
private class TestLegProcessTrigger { 
    private static testMethod void Test_LegProcessTrigger () { 
        try{
            Leg__c fw = new Leg__c(); 
            insert fw; 
            System.assertNotEquals(null, fw.id); 
            update fw; 
            delete fw;
        } catch(Exception e){
            FSTR.COTestFactory.FillAllFields=true;
            Leg__c fw = (Leg__c)FSTR.COTestFactory.createSObject('Leg__c',true); 
            insert fw; 
            System.assertNotEquals(null, fw.id); 
            update fw; 
            delete fw;
        }
    } 
}