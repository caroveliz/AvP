/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
@IsTest
private class dlrs_Peak_DaysTest
{
    @IsTest
    private static void testTrigger()
    {
        // Force the dlrs_Peak_DaysTrigger to be invoked, fails the test if org config or other Apex code prevents this.
        dlrs.RollupService.testHandler(new Peak_Days__c());
    }
}