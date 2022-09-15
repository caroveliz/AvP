<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>DEPX2_Onboarding_Request_Contracts_from_Vendors</fullName>
        <description>obsolete - 2. Onboarding: Request Contracts from Vendors</description>
        <protected>false</protected>
        <recipients>
            <recipient>michelle@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Onboarding_Email_Alerts/DEPX2_Request_Contracts_from_Vendors</template>
    </alerts>
    <alerts>
        <fullName>X1_Onboarding_Send_Auth_for_Signature</fullName>
        <description>1. Onboarding: Send Auth to Vendors</description>
        <protected>false</protected>
        <recipients>
            <recipient>michelle@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Onboarding_Email_Alerts/Send_Authorizations_for_signature</template>
    </alerts>
    <alerts>
        <fullName>X24_Hour_Follow_Up_on_Agreement_Sent</fullName>
        <description>24 Hour Follow Up on Agreement Sent</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>craig@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>luke@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/X24_Hour_Follow_Up_on_Agreement_Sent</template>
    </alerts>
    <alerts>
        <fullName>X24_Hour_Follow_Up_on_Proposal_Sent</fullName>
        <description>24 Hour Follow Up on Proposal Sent</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>craig@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>luke@aviationportfolio.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/X24_Hour_Follow_Up_on_Proposal_Sent</template>
    </alerts>
    <tasks>
        <fullName>Follow_Up_on_Agreement_Sent</fullName>
        <assignedToType>owner</assignedToType>
        <description>It has been 24 hours since the Agreement was sent.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Opportunity.Agreement_Sent__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow Up on Agreement Sent</subject>
    </tasks>
    <tasks>
        <fullName>Month_1_Call</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>21</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CloseDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Month 1 Call</subject>
    </tasks>
    <tasks>
        <fullName>Month_1_Email</fullName>
        <assignedTo>craig@aviationportfolio.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>30</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CloseDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Month 1 Email</subject>
    </tasks>
</Workflow>
