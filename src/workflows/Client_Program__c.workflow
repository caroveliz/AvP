<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>X3_Onboarding_New_program_Added</fullName>
        <description>3. Onboarding: New program Added</description>
        <protected>false</protected>
        <recipients>
            <recipient>michelle@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Onboarding_Email_Alerts/Program_Record_Added_need_Flight_History</template>
    </alerts>
    <alerts>
        <fullName>X4_Onboarding_Onboarding_Complete</fullName>
        <description>4. Onboarding: Onboarding Complete</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>michelle@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Onboarding_Email_Alerts/Onboarding_Complete</template>
    </alerts>
    <fieldUpdates>
        <fullName>Set_Program_Account_Name_Text</fullName>
        <field>Account_Name_Text__c</field>
        <formula>Account__r.Name</formula>
        <name>Set Program Account Name Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Populate Account Name Text</fullName>
        <actions>
            <name>Set_Program_Account_Name_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>isnew()||ischanged( Account__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Program Year Amount Exceeds Program</fullName>
        <actions>
            <name>Program_Year_Allotted_Hours_EXCEEDS_Program_s_Total_Allotted_Hours</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>and(ischanged(Rolled_Up_Allotted_Hours__c),Rolled_Up_Allotted_Hours__c&lt;&gt;0,not(isnull(Rolled_Up_Allotted_Hours__c)), Rolled_Up_Allotted_Hours__c &gt; Total_Allotted_Hours__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Program_Year_Allotted_Hours_EXCEEDS_Program_s_Total_Allotted_Hours</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Program Year Allotted Hours EXCEEDS Program&apos;s Total Allotted Hours</subject>
    </tasks>
</Workflow>
