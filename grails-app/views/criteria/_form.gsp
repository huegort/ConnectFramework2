<%@ page import="com.guru.connectframework.criteria.Criteria" %>



<div class="fieldcontain ${hasErrors(bean: criteriaInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="criteria.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${criteriaInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaInstance, field: 'feedback', 'error')} ">
    <label for="notes">
        <g:message code="criteria.notes.label" default="Notes"/>

    </label>
    <g:textField name="notes" value="${criteriaInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaInstance, field: 'container', 'error')} required">
    <label for="container">
        <g:message code="criteria.container.label" default="Container"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="container" name="container.id" from="${com.guru.connectframework.criteria.CriteriaContainer.list()}"
              optionKey="id" required="" value="${criteriaInstance?.container?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaInstance, field: 'dataType', 'error')} required">
    <label for="dataType">
        <g:message code="criteria.dataType.label" default="Data Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="dataType" from="${com.guru.connectframework.CriteriaType?.values()}"
              keys="${com.guru.connectframework.CriteriaType.values()*.name()}" required=""
              value="${criteriaInstance?.dataType?.name()}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="criteria.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${criteriaInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaInstance, field: 'sequenceNumber', 'error')} required">
    <label for="sequenceNumber">
        <g:message code="criteria.sequenceNumber.label" default="Sequence Number"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="sequenceNumber" type="number" value="${criteriaInstance.sequenceNumber}" required=""/>

</div>

