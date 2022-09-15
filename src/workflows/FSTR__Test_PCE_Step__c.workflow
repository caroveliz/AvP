<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>FSTR__Email_upon_Queue_Assignment</fullName>
        <description>Email upon Queue Assignment</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FSTR__ProcessComposer/FSTR__Test_PCE_Step_Assignment_Notification</template>
    </alerts>
    <rules>
        <fullName>FSTR__Email When Assigned to Queue</fullName>
        <actions>
            <name>FSTR__Email_upon_Queue_Assignment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>FSTR__Test_PCE_Step__c.FSTR__Email_Queue_Members__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
