<%@ page import="com.guru.connectframework.institution.Institution" %>



<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="institution.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${institutionInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="institution.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${institutionInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="institution.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="country" name="country.id" from="${com.guru.connectframework.institution.Country.list()}" optionKey="id" required="" value="${institutionInstance?.country?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="institution.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${institutionInstance?.name}"/>

</div>

