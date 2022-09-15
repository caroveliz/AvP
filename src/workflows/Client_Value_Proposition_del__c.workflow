<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Account_Name_text_CVP</fullName>
        <field>Account_Name_Text__c</field>
        <formula>Account__r.Name</formula>
        <name>Set Account Name text CVP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Populate Account Name Text CVP</fullName>
        <actions>
            <name>Set_Account_Name_text_CVP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>isnew()||ischanged( Account__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
