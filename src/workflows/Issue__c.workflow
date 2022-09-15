<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Issue_Modified</fullName>
        <description>Issue Modified</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Issue_Templates/Issues_Issue_Modified</template>
    </alerts>
    <alerts>
        <fullName>New_Issue_Created</fullName>
        <description>New Issue Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>omnivo-aviation@omnivodigital.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Issue_Templates/Issues_New_Issue</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_Owner_to_Rob</fullName>
        <field>OwnerId</field>
        <lookupValue>michelle@aviationportfolio.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Rob</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Changed Issue</fullName>
        <actions>
            <name>Issue_Modified</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>and(not(isnew()),ischanged( LastModifiedDate ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Issue</fullName>
        <actions>
            <name>New_Issue_Created</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Rob</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Issue__c.CreatedById</field>
            <operation>notEqual</operation>
            <value>Corp Admin</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
