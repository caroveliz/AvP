trigger Client_ProgramBothTrigger on Client_Program__c (after insert, before insert, before update, after update, before delete, after delete) { 
    FSTR.COTriggerHandler.handleBothTrigger();
}