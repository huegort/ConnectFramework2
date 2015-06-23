<%@ page import="com.guru.connectframework.activity.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'approver', 'error')} required">
	<label for="approver">
		<g:message code="activity.approver.label" default="Approver" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="approver" name="approver.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${activityInstance?.approver?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="activity.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${activityInstance?.created}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'criteriaData', 'error')} ">
	<label for="criteriaData">
		<g:message code="activity.criteriaData.label" default="Criteria Data" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityInstance?.criteriaData?}" var="c">
    <li><g:link controller="activityCriteriaData" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activityCriteriaData" action="create" params="['activity.id': activityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activityCriteriaData.label', default: 'ActivityCriteriaData')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'dateApproved', 'error')} required">
	<label for="dateApproved">
		<g:message code="activity.dateApproved.label" default="Date Approved" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateApproved" precision="day"  value="${activityInstance?.dateApproved}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="activity.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institution" name="institution.id" from="${com.guru.connectframework.institution.Institution.list()}" optionKey="id" required="" value="${activityInstance?.institution?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="activity.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${activityInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="activity.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.guru.connectframework.CriteriaStatus?.values()}" keys="${com.guru.connectframework.CriteriaStatus.values()*.name()}" required="" value="${activityInstance?.status?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="activity.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.guru.connectframework.activity.ActivityType.list()}" optionKey="id" required="" value="${activityInstance?.type?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'validUntil', 'error')} required">
	<label for="validUntil">
		<g:message code="activity.validUntil.label" default="Valid Until" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validUntil" precision="day"  value="${activityInstance?.validUntil}"  />

</div>

