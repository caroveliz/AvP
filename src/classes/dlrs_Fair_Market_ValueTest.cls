/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
@IsTest
private class dlrs_Fair_Market_ValueTest
{
    @IsTest
    private static void testTrigger()
    {
        // Force the dlrs_Fair_Market_ValueTrigger to be invoked, fails the test if org config or other Apex code prevents this.
        dlrs.RollupService.testHandler(new Fair_Market_Value__c());
    }
}