<%@ page import="com.guru.connectframework.institution.Institution" %>

<g:hiddenField name="id" value="-1"></g:hiddenField>

<div class="fieldcontain ${hasErrors(bean: institution, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="institution.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="form-control" name="name" required="" value="${institution?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institution, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="institution.description.label" default="Description"/>

    </label>
    <g:textField class="form-control" name="description" value="${institution?.description}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: institution, field: 'address1', 'error')} required">
    <label for="address1">
        <g:message code="institution.address1.label" default="Address1"/>
        <span class="required-indicator">*</span>

    </label>
    <g:textField class="form-control" name="address1" required="" value="${institution?.address1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institution, field: 'address2', 'error')} ">
    <label for="address2">
        <g:message code="institution.address2.label" default="Address2"/>
    </label>
    <g:textField class="form-control" name="address2" value="${institution?.address2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institution, field: 'provence', 'error')} ">
    <label for="provence">
        <g:message code="institution.provence.label" default="Provence"/>
    </label>
    <g:textField class="form-control" name="provence" value="${institution?.provence}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institution, field: 'postcode', 'error')} ">
    <label for="postcode">
        <g:message code="institution.postcode.label" default="Postcode"/>
    </label>
    <g:textField class="form-control" name="postcode" value="${institution?.postcode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institution, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="institution.country.label" default="Country"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="country" name="countryId" from="${com.guru.connectframework.institution.Country.list()}"
              optionKey="id" optionValue="name" required="" value="${institution?.country?.id}"
              class="many-to-one form-control"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institution, field: 'notes', 'error')} ">
    <label for="notes">
        <g:message code="institution.notes.label" default="Notes"/>

    </label>
    <g:textField class="form-control" name="notes" value="${institution?.notes}"/>

</div>

