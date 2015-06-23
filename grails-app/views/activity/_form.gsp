<%@ page import="connectframework2.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="activity.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${activityInstance?.created}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activity.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'partnership', 'error')} required">
	<label for="partnership">
		<g:message code="activity.partnership.label" default="Partnership" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="partnership" required="" value="${activityInstance?.partnership}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'validUntil', 'error')} required">
	<label for="validUntil">
		<g:message code="activity.validUntil.label" default="Valid Until" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validUntil" precision="day"  value="${activityInstance?.validUntil}"  />

</div>

