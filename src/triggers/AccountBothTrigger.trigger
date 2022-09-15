trigger AccountBothTrigger on Account (after insert, before insert, before update, after update, before delete, after delete) { 
    FSTR.COTriggerHandler.handleBothTrigger();
}