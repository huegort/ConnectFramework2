<%@ page import="com.guru.connectframework.institution.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="contact.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${contactInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'roleInInstitution', 'error')} ">
	<label for="roleInInstitution">
		<g:message code="contact.roleInInstitution.label" default="Role In Institution" />
		
	</label>
	<g:textField name="roleInInstitution" value="${contactInstance?.roleInInstitution}"/>

</div>

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

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="contact.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${contactInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="contact.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institution" name="institution.id" from="${com.guru.connectframework.institution.Institution.list()}" optionKey="id" required="" value="${contactInstance?.institution?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="contact.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${contactInstance?.lastName}"/>

</div>

