@isTest
private class TestAccountBothTrigger { 
    private static testMethod void Test_AccountBothTrigger () { 
        try{
            Account fw = new Account(); 
            insert fw; 
            System.assertNotEquals(null, fw.id); 
            update fw; 
            delete fw;
        } catch(Exception e){
            FSTR.COTestFactory.FillAllFields=true;
            Account fw = (Account)FSTR.COTestFactory.createSObject('Account',true); 
            insert fw; 
            System.assertNotEquals(null, fw.id); 
            update fw; 
            delete fw;
        }
    } 
}