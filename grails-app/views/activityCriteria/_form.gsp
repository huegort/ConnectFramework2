<%@ page import="com.guru.connectframework.activity.ActivityCriteria" %>



<div class="fieldcontain ${hasErrors(bean: activityCriteriaInstance, field: 'activityType', 'error')} required">
	<label for="activityType">
		<g:message code="activityCriteria.activityType.label" default="Activity Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activityType" name="activityType.id" from="${com.guru.connectframework.activity.ActivityType.list()}" optionKey="id" required="" value="${activityCriteriaInstance?.activityType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activityCriteria.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityCriteriaInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaInstance, field: 'sequenceNumber', 'error')} required">
	<label for="sequenceNumber">
		<g:message code="activityCriteria.sequenceNumber.label" default="Sequence Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sequenceNumber" type="number" value="${activityCriteriaInstance.sequenceNumber}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="activityCriteria.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${com.guru.connectframework.CriteriaType?.values()}" keys="${com.guru.connectframework.CriteriaType.values()*.name()}" required="" value="${activityCriteriaInstance?.type?.name()}" />

</div>

