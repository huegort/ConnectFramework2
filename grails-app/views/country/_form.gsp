<%@ page import="com.guru.connectframework.institution.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="country.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${countryInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="country.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="region" name="region.id" from="${com.guru.connectframework.institution.Region.list()}" optionKey="id" required="" value="${countryInstance?.region?.id}" class="many-to-one"/>

</div>

