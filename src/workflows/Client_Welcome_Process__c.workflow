<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Checklist_1_for_Client_Welcome</fullName>
        <description>Checklist 1 for Client Welcome</description>
        <protected>false</protected>
        <recipients>
            <recipient>craig@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>luke@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Client_Welcome_1</template>
    </alerts>
    <alerts>
        <fullName>Checklist_2_for_Client_Welcome</fullName>
        <description>Checklist 2 for Client Welcome</description>
        <protected>false</protected>
        <recipients>
            <recipient>craig@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>luke@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Client_Welcome_2</template>
    </alerts>
    <rules>
        <fullName>Client Welcome Process</fullName>
        <actions>
            <name>Checklist_1_for_Client_Welcome</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Client_Welcome_Process_1</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Client_Welcome_Process_Phase_1</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Client_Welcome_Process__c.Money_Collected__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Checklist_2_for_Client_Welcome</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Client_Welcome_Process_2</name>
                <type>Task</type>
            </actions>
            <actions>
                <name>Client_Welcome_Process_Phase_2</name>
                <type>Task</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Client_Welcome_Process_1</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Do we have a signed contract? 

Gather information 

Have we sent all appropriate authorization forms to client? 

Welcome Call 

Thank you note sent.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Client Welcome Process Phase 1</subject>
    </tasks>
    <tasks>
        <fullName>Client_Welcome_Process_2</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Has executed agreement been returned? 

Have we collected all authorization forms? 

Collect DL and Passports 

Create vCard</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Client Welcome Process Phase 2</subject>
    </tasks>
    <tasks>
        <fullName>Client_Welcome_Process_Phase_1</fullName>
        <assignedTo>danielle@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Do we have a signed contract? 

Gather information 

Have we sent all appropriate authorization forms to client? 

Welcome Call 

Thank you note sent.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Client Welcome Process Phase 1</subject>
    </tasks>
    <tasks>
        <fullName>Client_Welcome_Process_Phase_2</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Has executed agreement been returned? 

Have we collected all authorization forms? 

Collect DL and Passports 

Create vCard</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Client Welcome Process Phase 2</subject>
    </tasks>
</Workflow>
