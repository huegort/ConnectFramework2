<%@ page import="com.guru.connectframework.criteria.Approval" %>



<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="approval.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${approvalInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'approvedBy', 'error')} required">
	<label for="approvedBy">
		<g:message code="approval.approvedBy.label" default="Approved By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="approvedBy" name="approvedBy.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${approvalInstance?.approvedBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="approval.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${approvalInstance?.created}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="approval.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${approvalInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'dateApproved', 'error')} required">
	<label for="dateApproved">
		<g:message code="approval.dateApproved.label" default="Date Approved" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateApproved" precision="day"  value="${approvalInstance?.dateApproved}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="approval.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.guru.connectframework.CriteriaStatus?.values()}" keys="${com.guru.connectframework.CriteriaStatus.values()*.name()}" required="" value="${approvalInstance?.status?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'validTo', 'error')} required">
	<label for="validTo">
		<g:message code="approval.validTo.label" default="Valid To" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validTo" precision="day"  value="${approvalInstance?.validTo}"  />

</div>

