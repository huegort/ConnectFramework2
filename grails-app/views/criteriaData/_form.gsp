<%@ page import="com.guru.connectframework.criteria.CriteriaData" %>



<div class="fieldcontain ${hasErrors(bean: criteriaDataInstance, field: 'valueString', 'error')} ">
	<label for="valueString">
		<g:message code="criteriaData.valueString.label" default="Value String" />
		
	</label>
	<g:textField name="valueString" value="${criteriaDataInstance?.valueString}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaDataInstance, field: 'valueDocument', 'error')} ">
	<label for="valueDocument">
		<g:message code="criteriaData.valueDocument.label" default="Value Document" />
		
	</label>
	<g:select id="valueDocument" name="valueDocument.id" from="${com.guru.connectframework.util.Document.list()}" optionKey="id" value="${criteriaDataInstance?.valueDocument?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaDataInstance, field: 'valueDate', 'error')} ">
	<label for="valueDate">
		<g:message code="criteriaData.valueDate.label" default="Value Date" />
		
	</label>
	<g:datePicker name="valueDate" precision="day"  value="${criteriaDataInstance?.valueDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaDataInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="criteriaData.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${criteriaDataInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaDataInstance, field: 'approval', 'error')} required">
	<label for="approval">
		<g:message code="criteriaData.approval.label" default="Approval" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="approval" name="approval.id" from="${com.guru.connectframework.criteria.Approval.list()}" optionKey="id" required="" value="${criteriaDataInstance?.approval?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaDataInstance, field: 'container', 'error')} required">
	<label for="container">
		<g:message code="criteriaData.container.label" default="Container" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="container" name="container.id" from="${com.guru.connectframework.criteria.CriteriaDataContainer.list()}" optionKey="id" required="" value="${criteriaDataInstance?.container?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criteriaDataInstance, field: 'criteria', 'error')} required">
	<label for="criteria">
		<g:message code="criteriaData.criteria.label" default="Criteria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="criteria" name="criteria.id" from="${com.guru.connectframework.criteria.Criteria.list()}" optionKey="id" required="" value="${criteriaDataInstance?.criteria?.id}" class="many-to-one"/>

</div>

