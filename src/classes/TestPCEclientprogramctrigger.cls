@isTest 
 private class TestPCEclientprogramctrigger { private static testMethod void Test_TestPCEclientprogramctrigger () { 
 FSTR.COTestFactory.FillAllFields=true; 
 client_program__c fw = (client_program__c)FSTR.COTestFactory.createSObject('client_program__c', false); 
 insert fw; 
 System.assertNotEquals(null, fw.id); 
 update fw; 
 delete fw;} 
}