<%@ page import="com.guru.connectframework.activity.ActivityCriteriaData" %>



<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="activityCriteriaData.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${com.guru.connectframework.activity.Activity.list()}" optionKey="id" required="" value="${activityCriteriaDataInstance?.activity?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'approvedBy', 'error')} required">
	<label for="approvedBy">
		<g:message code="activityCriteriaData.approvedBy.label" default="Approved By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="approvedBy" name="approvedBy.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${activityCriteriaDataInstance?.approvedBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'associatedCriteria', 'error')} required">
	<label for="associatedCriteria">
		<g:message code="activityCriteriaData.associatedCriteria.label" default="Associated Criteria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="associatedCriteria" name="associatedCriteria.id" from="${com.guru.connectframework.activity.ActivityCriteria.list()}" optionKey="id" required="" value="${activityCriteriaDataInstance?.associatedCriteria?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="activityCriteriaData.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${activityCriteriaDataInstance?.created}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'dataApproved', 'error')} required">
	<label for="dataApproved">
		<g:message code="activityCriteriaData.dataApproved.label" default="Data Approved" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataApproved" precision="day"  value="${activityCriteriaDataInstance?.dataApproved}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'dateData', 'error')} required">
	<label for="dateData">
		<g:message code="activityCriteriaData.dateData.label" default="Date Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateData" precision="day"  value="${activityCriteriaDataInstance?.dateData}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="activityCriteriaData.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.guru.connectframework.CriteriaStatus?.values()}" keys="${com.guru.connectframework.CriteriaStatus.values()*.name()}" required="" value="${activityCriteriaDataInstance?.status?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'stringData', 'error')} required">
	<label for="stringData">
		<g:message code="activityCriteriaData.stringData.label" default="String Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stringData" required="" value="${activityCriteriaDataInstance?.stringData}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityCriteriaDataInstance, field: 'validUntil', 'error')} required">
	<label for="validUntil">
		<g:message code="activityCriteriaData.validUntil.label" default="Valid Until" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validUntil" precision="day"  value="${activityCriteriaDataInstance?.validUntil}"  />

</div>

