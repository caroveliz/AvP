<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Airport_Feasibility_Score</fullName>
        <field>Airport_Feasibility_Score__c</field>
        <formula>IF( BEGINS( TEXT(Airport_Feasibility__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Airport_Feasibility__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Airport_Feasibility__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Airport Feasibility Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Airport_Feasibility_Score_Post</fullName>
        <field>Airport_Feasibility_Sc_Post__c</field>
        <formula>IF( BEGINS( TEXT(Airport_Feasibility_Post__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Airport_Feasibility_Post__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Airport_Feasibility_Post__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Airport Feasibility Score - Post</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Airport_Weather_History_Score</fullName>
        <field>Airport_Weather_History_Score__c</field>
        <formula>IF( BEGINS( TEXT(Airport_Weather_History__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Airport_Weather_History__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Airport_Weather_History__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Airport Weather History Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Airport_Weather_History_Score_P</fullName>
        <description>Update Airport Weather History Score - Post</description>
        <field>Airport_Weather_History_Sc_Post__c</field>
        <formula>IF( BEGINS( TEXT(Airport_Weather_History_Post__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Airport_Weather_History_Post__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Airport_Weather_History_Post__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Airport Weather History Score - P</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Backup_Recovery_Score</fullName>
        <field>Backup_Recovery_Score__c</field>
        <formula>IF( BEGINS( TEXT(Backup_Recovery__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Backup_Recovery__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Backup_Recovery__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Backup &amp; Recovery Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Backup_Recovery_Score_Post</fullName>
        <field>Backup_Recovery_Sc_Post__c</field>
        <formula>IF( BEGINS( TEXT(Backup_Recovery_Post__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Backup_Recovery_Post__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Backup_Recovery_Post__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Backup &amp; Recovery Score - Post</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Day_of_Travel_Score</fullName>
        <field>Day_of_Travel_Score__c</field>
        <formula>IF( BEGINS( TEXT(Day_of_Travel__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Day_of_Travel__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Day_of_Travel__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Day of Travel Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Day_of_Travel_Score_Post</fullName>
        <field>Day_of_Travel_Sc_Post__c</field>
        <formula>IF( BEGINS( TEXT(Day_of_Travel_Post__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Day_of_Travel_Post__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Day_of_Travel_Post__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Day of Travel Score - Post</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Depart_Date_Score</fullName>
        <field>Depart_Date_Service_Impact_Score__c</field>
        <formula>IF( BEGINS( TEXT(Depart_Date_Service_Impact__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Depart_Date_Service_Impact__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Depart_Date_Service_Impact__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Depart Date Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Depart_Date_Score_Post</fullName>
        <field>Depart_Date_Sc_Post__c</field>
        <formula>IF( BEGINS( TEXT(Depart_Date_Service_Impact_Post__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Depart_Date_Service_Impact_Post__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Depart_Date_Service_Impact_Post__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Depart Date Score - Post</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Depart_Flex_Score</fullName>
        <field>Depart_Flex_Cancellation_Score__c</field>
        <formula>IF( BEGINS( TEXT(Depart_Flex_Cancellation__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Depart_Flex_Cancellation__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Depart_Flex_Cancellation__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Depart. Flex. Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Depart_Flex_Score_Post</fullName>
        <field>Depart_Flex_Cancel_Sc_Post__c</field>
        <formula>IF( BEGINS( TEXT(Depart_Flex_Cancellation_Post__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Depart_Flex_Cancellation_Post__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Depart_Flex_Cancellation_Post__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Depart. Flex. Score - Post</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Mission_Feasibility_Score</fullName>
        <field>Mission_Feasibility_Score__c</field>
        <formula>IF( BEGINS( TEXT(Mission_Feasibility__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Mission_Feasibility__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Mission_Feasibility__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Mission Feasibility Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Mission_Feasibility_Score_Post</fullName>
        <field>Mission_Feasibility_Sc_Post__c</field>
        <formula>IF( BEGINS( TEXT(Mission_Feasibility_Post__c) , &quot;1&quot;) , 1, 
IF(BEGINS( TEXT(Mission_Feasibility_Post__c) , &quot;2&quot;), 2, 
IF(BEGINS( TEXT(Mission_Feasibility_Post__c) , &quot;3&quot;), 3, null 
) 
) 
)</formula>
        <name>Update Mission Feasibility Score - Post</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Conga_Workflow_Subcontracted_Tail</fullName>
        <apiVersion>39.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>SubContracted_Tail_Info_Email__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>jennifer@aviationportfolio.com</integrationUser>
        <name>Conga Workflow - Subcontracted Tail</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Auto Subcontracted Tail Email</fullName>
        <actions>
            <name>Conga_Workflow_Subcontracted_Tail</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND (3 or 4) and 5</booleanFilter>
        <criteriaItems>
            <field>Leg__c.Sub_Contracted__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Leg__c.Departure_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Leg__c.Flight_Status__c</field>
            <operation>equals</operation>
            <value>Booked</value>
        </criteriaItems>
        <criteriaItems>
            <field>Leg__c.Flight_Status__c</field>
            <operation>equals</operation>
            <value>Cleared</value>
        </criteriaItems>
        <criteriaItems>
            <field>Leg__c.Operator_Name__c</field>
            <operation>notEqual</operation>
            <value>Executive Jet Management</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Risk Scores</fullName>
        <actions>
            <name>Update_Airport_Feasibility_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Airport_Weather_History_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Backup_Recovery_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Day_of_Travel_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Depart_Date_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Depart_Flex_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Mission_Feasibility_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Risk Scores - Post</fullName>
        <actions>
            <name>Update_Airport_Feasibility_Score_Post</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Airport_Weather_History_Score_P</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Backup_Recovery_Score_Post</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Day_of_Travel_Score_Post</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Depart_Date_Score_Post</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Depart_Flex_Score_Post</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Mission_Feasibility_Score_Post</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
