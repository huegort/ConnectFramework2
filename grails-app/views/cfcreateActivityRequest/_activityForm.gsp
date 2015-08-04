<%@ page import="com.guru.connectframework.activity.Activity" %>


<div class="fieldcontain ${hasErrors(bean: activity, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="activity.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="form-control" name="name" required="" value="${activity?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activity, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="activity.description.label" default="Description" />

    </label>
    <g:textField class="form-control" name="description" value="${activity?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activity, field: 'contact', 'error')} ">
    <label for="contact">
        <g:message code="activity.contact.label" default="Contact" />

    </label>
    <g:select id="contact" name="contact.id" from="${com.guru.connectframework.institution.Contact.findAllByInstitution(institution)}" optionKey="id" value="${activity?.contact?.name}" class="many-to-one form-control" noSelection="['null': '']"/>

</div>


