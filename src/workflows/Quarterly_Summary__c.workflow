<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Account_Name_Text</fullName>
        <field>Account_Name_Text__c</field>
        <formula>Client__r.Name</formula>
        <name>Set Account Name Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Set Account Name Text</fullName>
        <actions>
            <name>Set_Account_Name_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>isnew()||ischanged( Client__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
