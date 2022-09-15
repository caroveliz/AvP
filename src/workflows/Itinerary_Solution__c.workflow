<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Check_Winning_Itinerary</fullName>
        <field>Booked_Solution__c</field>
        <literalValue>1</literalValue>
        <name>Check Winning Itinerary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Not_Visible_Solution</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Not_Visible</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Not Visible Solution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Visible_Solution</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Visible</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Visible Solution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Confirmed Option Wins</fullName>
        <actions>
            <name>Check_Winning_Itinerary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Itinerary_Solution__c.Solution_Status__c</field>
            <operation>equals</operation>
            <value>Confirmed</value>
        </criteriaItems>
        <description>When the Status of an Itinerary Option is updated to &quot;Confirmed&quot;, it is checked as the Winning Itinerary.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Not Visible Solution</fullName>
        <actions>
            <name>Not_Visible_Solution</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Itinerary_Solution__c.Solution_Status__c</field>
            <operation>equals</operation>
            <value>Available,On Hold for Non-AvP Client,Unavailable,Requested</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Visible Solution</fullName>
        <actions>
            <name>Visible_Solution</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Itinerary_Solution__c.Solution_Status__c</field>
            <operation>equals</operation>
            <value>Booked,Cancelled,Owner Denied,Pending Owner Approval</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
