<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>90 day review</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Contact_Type__c</field>
            <operation>equals</operation>
            <value>Client</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Client_Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>X90_day_review</name>
                <type>Task</type>
            </actions>
            <timeLength>90</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>New Client Thankster</fullName>
        <actions>
            <name>CR_Thankster</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>CR_welcome_call</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>new_client_thankster</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>new_client_welcome_call</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Client_Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Contact_Type__c</field>
            <operation>equals</operation>
            <value>Client</value>
        </criteriaItems>
        <description>send thankster</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Tasks for Client Part 1</fullName>
        <active>false</active>
        <formula>includes( Contact_Type__c , &quot;Client&quot; )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month9call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>244</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month8call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>214</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month2call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>37</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month4call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>96</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month5call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>125</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month6call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>155</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month10call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>273</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month3call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>66</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month7call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>184</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month1call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Set Tasks for Client Part 2</fullName>
        <active>false</active>
        <formula>includes( Contact_Type__c , &quot;Client&quot; )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_ThankYou4BeingClientNote</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>180</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_RenewalCall1</name>
                <type>Task</type>
            </actions>
            <actions>
                <name>zClient_SendRenewalDocusign</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>270</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_RenewalCall2</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>300</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_ThankYou4PurchaseHandWrittenNote</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month12call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>332</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Monthly_DedicatedHoursLog</name>
                <type>Task</type>
            </actions>
            <actions>
                <name>zClient_Monthly_ValueReceived</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>360</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month11call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>303</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_RenewalCall3</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>330</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Set Tasks for Client Part 3</fullName>
        <active>false</active>
        <formula>includes( Contact_Type__c , &quot;Client&quot; )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month4Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>110</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month5Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>140</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month7Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>199</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month8Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>229</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month9Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>258</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month3Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>81</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month2Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>51</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month10Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>288</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month1Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>21</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>zClient_Month6Email</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
            <timeLength>170</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>CR_Thankster</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Did CR do this?</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CR Thankster</subject>
    </tasks>
    <tasks>
        <fullName>CR_welcome_call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Did CR do this?</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CR welcome call</subject>
    </tasks>
    <tasks>
        <fullName>Follow_Up</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Follow up with prospect; email sent 2 weeks ago</description>
        <dueDateOffset>15</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Monthly_Call_Aviator</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Monthly checking.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Monthly Call - Aviator</subject>
    </tasks>
    <tasks>
        <fullName>Schedule_Meeting</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Schedule Meeting</subject>
    </tasks>
    <tasks>
        <fullName>Schedule_Meeting2</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>180</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Schedule Meeting2</subject>
    </tasks>
    <tasks>
        <fullName>Schedule_Meeting_3</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>270</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Schedule Meeting 3</subject>
    </tasks>
    <tasks>
        <fullName>Schedule_Meeting_4</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>360</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Schedule Meeting 4</subject>
    </tasks>
    <tasks>
        <fullName>X90_day_review</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>90 day client review for each client</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>90 day review</subject>
    </tasks>
    <tasks>
        <fullName>new_client_thankster</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>new client thankster</subject>
    </tasks>
    <tasks>
        <fullName>new_client_welcome_call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>new client welcome call</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month10Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month10Email</description>
        <dueDateOffset>291</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 10</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month10call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month10call</description>
        <dueDateOffset>276</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 10</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month11Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month11Email</description>
        <dueDateOffset>321</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 11</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month11call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month11call</description>
        <dueDateOffset>306</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 11</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month12Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month12Email</description>
        <dueDateOffset>351</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 12</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month12call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month12call</description>
        <dueDateOffset>335</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 12</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month1Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month1Email</description>
        <dueDateOffset>24</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 1</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month1call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month1call</description>
        <dueDateOffset>10</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 1</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month2Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month2Email</description>
        <dueDateOffset>54</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 2</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month2call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month2call</description>
        <dueDateOffset>40</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 2</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month3Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month3Email</description>
        <dueDateOffset>84</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 3</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month3call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month3call</description>
        <dueDateOffset>69</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 3</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month4Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month4Email</description>
        <dueDateOffset>113</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 4</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month4call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month4call</description>
        <dueDateOffset>99</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 4</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month5Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month5Email</description>
        <dueDateOffset>143</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 5</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month5call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month5call</description>
        <dueDateOffset>128</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 5</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month6Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month6Email</description>
        <dueDateOffset>173</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 6</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month6call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month6call</description>
        <dueDateOffset>158</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 6</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month7Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month7Email</description>
        <dueDateOffset>202</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 7</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month7call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month7call</description>
        <dueDateOffset>187</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 7</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month8Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month8Email</description>
        <dueDateOffset>232</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Email 8</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month8call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month8call</description>
        <dueDateOffset>217</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 8</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month9Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month9Email</description>
        <dueDateOffset>261</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>EMail 9</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Month9call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Month9call</description>
        <dueDateOffset>247</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 9</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Monthly_DedicatedHoursLog</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Monthly-DedicatedHoursLog</description>
        <dueDateOffset>363</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Dedicated Hours Log</subject>
    </tasks>
    <tasks>
        <fullName>zClient_Monthly_ValueReceived</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-Monthly-ValueReceived</description>
        <dueDateOffset>363</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Montly Valued Received Report</subject>
    </tasks>
    <tasks>
        <fullName>zClient_RenewalCall1</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-RenewalCall1</description>
        <dueDateOffset>273</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Renewal Call 1</subject>
    </tasks>
    <tasks>
        <fullName>zClient_RenewalCall2</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-RenewalCall2</description>
        <dueDateOffset>303</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Renewal Call 2</subject>
    </tasks>
    <tasks>
        <fullName>zClient_RenewalCall3</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-RenewalCall3</description>
        <dueDateOffset>333</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Renewal Call 3</subject>
    </tasks>
    <tasks>
        <fullName>zClient_SendRenewalDocusign</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-SendRenewalDocusign</description>
        <dueDateOffset>273</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Send Renewal Docu Sign</subject>
    </tasks>
    <tasks>
        <fullName>zClient_ThankYou4BeingClientNote</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-ThankYou4BeingClientNote</description>
        <dueDateOffset>183</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Thank You for Being Client Note</subject>
    </tasks>
    <tasks>
        <fullName>zClient_ThankYou4PurchaseHandWrittenNote</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>zClient-ThankYou4PurchaseHandWrittenNote</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Contact.Client_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Thank You for Purchase Hand Written Note</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin1</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>30</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin1</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin10</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>300</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin10</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin11</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>330</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin11</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin12</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>360</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin12</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin2</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>60</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin2</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin3</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin3</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin4</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>120</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin4</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin5</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>150</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin5</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin6</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>180</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin6</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin7</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>210</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin7</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin8</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>240</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin8</subject>
    </tasks>
    <tasks>
        <fullName>zContactEmailCheckin9</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>270</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContactEmailCheckin9</subject>
    </tasks>
    <tasks>
        <fullName>zContact_Quarterly_Phone_Call_1</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContact Quarterly Phone Call 1</subject>
    </tasks>
    <tasks>
        <fullName>zContact_Quarterly_Phone_Call_2</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>180</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContact Quarterly Phone Call 2</subject>
    </tasks>
    <tasks>
        <fullName>zContact_Quarterly_Phone_Call_3</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>270</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContact Quarterly Phone Call 3</subject>
    </tasks>
    <tasks>
        <fullName>zContact_Quarterly_Phone_Call_4</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>360</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>zContact Quarterly Phone Call 4</subject>
    </tasks>
</Workflow>
