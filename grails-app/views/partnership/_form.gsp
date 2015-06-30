<%@ page import="com.guru.connectframework.partnership.Partnership" %>



<div class="fieldcontain ${hasErrors(bean: partnershipInstance, field: 'contact', 'error')} ">
	<label for="contact">
		<g:message code="partnership.contact.label" default="Contact" />
		
	</label>
	<g:select id="contact" name="contact.id" from="${com.guru.connectframework.institution.Contact.list()}" optionKey="id" value="${partnershipInstance?.contact?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="partnership.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${partnershipInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="partnership.activities.label" default="Activities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${partnershipInstance?.activities?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['partnership.id': partnershipInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: partnershipInstance, field: 'approval', 'error')} required">
	<label for="approval">
		<g:message code="partnership.approval.label" default="Approval" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="approval" name="approval.id" from="${com.guru.connectframework.criteria.Approval.list()}" optionKey="id" required="" value="${partnershipInstance?.approval?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipInstance, field: 'dataContainer', 'error')} required">
	<label for="dataContainer">
		<g:message code="partnership.dataContainer.label" default="Data Container" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dataContainer" name="dataContainer.id" from="${com.guru.connectframework.criteria.CriteriaDataContainer.list()}" optionKey="id" required="" value="${partnershipInstance?.dataContainer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="partnership.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institution" name="institution.id" from="${com.guru.connectframework.institution.Institution.list()}" optionKey="id" required="" value="${partnershipInstance?.institution?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="partnership.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${partnershipInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipInstance, field: 'partnershipLevel', 'error')} required">
	<label for="partnershipLevel">
		<g:message code="partnership.partnershipLevel.label" default="Partnership Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="partnershipLevel" name="partnershipLevel.id" from="${com.guru.connectframework.partnership.PartnershipLevel.list()}" optionKey="id" required="" value="${partnershipInstance?.partnershipLevel?.id}" class="many-to-one"/>

</div>

