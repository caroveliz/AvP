<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>CONGA_Jet_Card_Dollars_Remaining_Email</fullName>
        <apiVersion>41.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Jet_Card_Dollars_Remaining__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>michelle@aviationportfolio.com</integrationUser>
        <name>CONGA Jet Card Dollars Remaining Email</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Conga_Jet_Card_Hours_Remaining_Email</fullName>
        <apiVersion>41.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>CONGA_Jet_Card_Hours_Remaining__c</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>michelle@aviationportfolio.com</integrationUser>
        <name>Conga Jet Card Hours Remaining Email</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Conga_Workflow_email</fullName>
        <apiVersion>41.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Conga_Workflow_Frax_Hours_remaining__c</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>craig@aviationportfolio.com</integrationUser>
        <name>Conga Workflow email</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>CONGA JETCARD DOLLARS REMAINING</fullName>
        <actions>
            <name>CONGA_Jet_Card_Dollars_Remaining_Email</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>AND(
 RecordType.Name=&quot;Jetcard/Membership&quot;,
 Client_Program__r.Do_not_email_auto_booked_hours_notice__c =False,
ISCHANGED( Billed_Booked_Hours__c ), TEXT(Client_Program__r.Hours_or_Dollars_Program__c) =&quot;DOLLARS&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CONGA JETCARD HOURS REMAINING</fullName>
        <actions>
            <name>Conga_Jet_Card_Hours_Remaining_Email</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>AND(
 RecordType.Name=&quot;Jetcard/Membership&quot;,
 Client_Program__r.Do_not_email_auto_booked_hours_notice__c =False,
ISCHANGED( Billed_Booked_Hours__c ), TEXT(Client_Program__r.Hours_or_Dollars_Program__c) =&quot;Hours&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Conga Workflow Booked hours notification</fullName>
        <actions>
            <name>Conga_Workflow_email</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>AND(
OR(
RecordType.Name=&quot;Fractional Lease&quot;, RecordType.Name=&quot;Fractional Share&quot;
),
Client_Program__r.Do_not_email_auto_booked_hours_notice__c =False,
ISCHANGED( Billed_Booked_Hours__c )
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
