trigger LegTrigger on Leg__c (before insert, before update) {

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            LegHandler.SetEstimatedFlightTimeHours(Trigger.new);
        }
        if (Trigger.isUpdate) { 
            LegHandler.SetEstimatedFlightTimeHours(Trigger.new);
        }
    }
}