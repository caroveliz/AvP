<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_Account_Team</fullName>
        <ccEmails>team@aviationportfolio.com</ccEmails>
        <description>Notify Account Team</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Trip_Request</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Airport_Feasibility_Score</fullName>
        <field>Airport_Feasibility_Score__c</field>
        <formula>IF( BEGINS( TEXT(Airport_Feasibility__c) , &quot;1&quot;) , 1,  
    IF(BEGINS( TEXT(Airport_Feasibility__c) , &quot;2&quot;), 2,  
        IF(BEGINS( TEXT(Airport_Feasibility__c) , &quot;3&quot;), 3, null
        ) 
    ) 
 )</formula>
        <name>Update Airport Feasibility (Score)</name>
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
        <name>Update Airport Weather History (Score)</name>
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
        <name>Update Backup &amp; Recovery (Score)</name>
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
        <name>Update Day of Travel (Score)</name>
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
        <name>Update Depart Date (Score)</name>
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
        <fullName>Update_Mission_Feasibility_Score</fullName>
        <field>Mission_Feasibility_Score__c</field>
        <formula>IF( BEGINS( TEXT(Mission_Feasibility__c) , &quot;1&quot;) , 1,  
    IF(BEGINS( TEXT(Mission_Feasibility__c) , &quot;2&quot;), 2,  
        IF(BEGINS( TEXT(Mission_Feasibility__c) , &quot;3&quot;), 3, null
        ) 
    ) 
 )</formula>
        <name>Update Mission Feasibility (Score)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Airport Feasibility</fullName>
        <actions>
            <name>Update_Airport_Feasibility_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Airport_Feasibility__c</field>
            <operation>equals</operation>
            <value>1 - Low volume flight activity; not limited by airport operating hours,2 - Medium volume flight activity or potential airport operating hours concerns,3 - High volume flight activity and very real airport operating hours concerns</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Airport Weather History</fullName>
        <actions>
            <name>Update_Airport_Weather_History_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Airport_Weather_History__c</field>
            <operation>equals</operation>
            <value>1 - Airport is not traditionally impacted by bad weather,2 - Airport is occasionally impacted by bad weather,3 - Airport is highly sensitive and often impacted by poor weather</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Backup %26 Recovery</fullName>
        <actions>
            <name>Update_Backup_Recovery_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Backup_Recovery__c</field>
            <operation>equals</operation>
            <value>1 - NetJets/FlexJet/Sentient,2 - EJM/National Charter,3 - Local Charter/Broker</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Day of Travel</fullName>
        <actions>
            <name>Update_Day_of_Travel_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Day_of_Travel__c</field>
            <operation>equals</operation>
            <value>1 - No time sensitivity after landing,2 - Time sensitive event 5 hours + after landing,3 - Time sensitive event less than 5 hours after landing</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Depart%2E Date %5BService Impact%5D</fullName>
        <actions>
            <name>Update_Depart_Date_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Depart_Date_Service_Impact__c</field>
            <operation>equals</operation>
            <value>1 - Lowest volume 300 days,2 - Medium Volume Days 35 days,&quot;3 - Highest Volume 30 Days including the Official Peak Days with NetJets (10), Flexjet (10) and Sentient (18)&quot;</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Departure Flexibility and Cancellation</fullName>
        <actions>
            <name>Update_Depart_Flex_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Depart_Flex_Cancellation__c</field>
            <operation>equals</operation>
            <value>1 - NetJets/FlexJet/Sentient,2 - EJM/National Charter/Dedicated Craft,3 - Local Charter/Broker</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mission Feasibility</fullName>
        <actions>
            <name>Update_Mission_Feasibility_Score</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Mission_Feasibility__c</field>
            <operation>equals</operation>
            <value>1 - No expected aircraft performance issues based on range/pax count,2 - There may be aircraft performance issues based on range/pax count,3 - There is a high probability of aircraft performance issues based on range/pax count</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Trip Request Notification</fullName>
        <actions>
            <name>Notify_Account_Team</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>CreatedBy.Profile.Id  = &quot;00eU0000001A7Ao&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Risk Score Population</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Day_of_Travel__c</field>
            <operation>equals</operation>
            <value>1 - No time sensitivity after landing,2 - Time sensitive event 5 hours + after landing,3 - Time sensitive event less than 5 hours after landing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Backup_Recovery__c</field>
            <operation>equals</operation>
            <value>1 - NetJets/FlexJet/Sentient,2 - EJM/National Charter,3 - Local Charter/Broker</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>New_Trip_Manager</fullName>
        <assignedTo>Account Manager</assignedTo>
        <assignedToType>accountTeam</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>New Trip Manager</subject>
    </tasks>
</Workflow>
