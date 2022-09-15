trigger Client_Program_YearProcessTrigger on Client_Program_Year__c (after insert, before insert, before update, after update, before delete){
    FSTR.COTriggerHandler.handleProcessObjectTrigger();
}