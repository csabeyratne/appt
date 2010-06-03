<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>sendwelcomesms</fullName>
        <description>Send Welcome SMS</description>
        <protected>false</protected>
        <recipients>
            <field>Mobile_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Mobile_Emails/Mobile_Welcome</template>
    </alerts>
    <fieldUpdates>
        <fullName>updatemobileemail</fullName>
        <description>(215) 275-6557</description>
        <field>Mobile_Email__c</field>
        <formula>SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(MobilePhone,&quot;(&quot;,&quot;&quot;),&quot;)&quot;,&quot;&quot;),&quot; &quot;,&quot;&quot;),&quot;-&quot;,&quot;&quot;) &amp;  &quot;@&quot; &amp; Mobile_Provider__r.Gateway_Address__c</formula>
        <name>Update Mobile Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Mobile Email Update</fullName>
        <actions>
            <name>updatemobileemail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.MobilePhone</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Update the Mobile Email field by combining mobile number and mobile provider.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SMS Message Update</fullName>
        <actions>
            <name>sendwelcomesms</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Mobile_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Send an SMS email to the Mobile Email listed in the Contact.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
