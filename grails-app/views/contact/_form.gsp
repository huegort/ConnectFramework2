<%@ page import="com.guru.connectframework.institution.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="contact.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${contactInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="contact.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${contactInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="contact.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institution" name="institution.id" from="${com.guru.connectframework.institution.Institution.list()}" optionKey="id" required="" value="${contactInstance?.institution?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="contact.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${contactInstance?.name}"/>

</div>

