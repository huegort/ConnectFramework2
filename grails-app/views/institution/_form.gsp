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

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'currentHighest', 'error')} ">
	<label for="currentHighest">
		<g:message code="institution.currentHighest.label" default="Current Highest" />
		
	</label>
	<g:select id="currentHighest" name="currentHighest.id" from="${com.guru.connectframework.partnership.Partnership.list()}" optionKey="id" value="${institutionInstance?.currentHighest?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="institution.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${institutionInstance?.address1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="institution.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${institutionInstance?.address2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'provence', 'error')} ">
	<label for="provence">
		<g:message code="institution.provence.label" default="Provence" />
		
	</label>
	<g:textField name="provence" value="${institutionInstance?.provence}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'postcode', 'error')} ">
	<label for="postcode">
		<g:message code="institution.postcode.label" default="Postcode" />
		
	</label>
	<g:textField name="postcode" value="${institutionInstance?.postcode}"/>

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

