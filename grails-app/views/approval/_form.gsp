<%@ page import="com.guru.connectframework.criteria.Approval" %>



<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="approval.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${approvalInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'dateArchived', 'error')} ">
	<label for="dateArchived">
		<g:message code="approval.dateArchived.label" default="Date Archived" />
		
	</label>
	<g:datePicker name="dateArchived" precision="day"  value="${approvalInstance?.dateArchived}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'dateApproved', 'error')} ">
	<label for="dateApproved">
		<g:message code="approval.dateApproved.label" default="Date Approved" />
		
	</label>
	<g:datePicker name="dateApproved" precision="day"  value="${approvalInstance?.dateApproved}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'dateEndorsed', 'error')} ">
	<label for="dateEndorsed">
		<g:message code="approval.dateEndorsed.label" default="Date Endorsed" />
		
	</label>
	<g:datePicker name="dateEndorsed" precision="day"  value="${approvalInstance?.dateEndorsed}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'validTo', 'error')} ">
	<label for="validTo">
		<g:message code="approval.validTo.label" default="Valid To" />
		
	</label>
	<g:datePicker name="validTo" precision="day"  value="${approvalInstance?.validTo}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'approver', 'error')} required">
	<label for="approver">
		<g:message code="approval.approver.label" default="Approver" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="approver" name="approver.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${approvalInstance?.approver?.id}" class="many-to-one"/>

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

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'endorser', 'error')} required">
	<label for="endorser">
		<g:message code="approval.endorser.label" default="Endorser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="endorser" name="endorser.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${approvalInstance?.endorser?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="approval.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.guru.connectframework.Criteria.CriteriaStatus?.values()}" keys="${com.guru.connectframework.Criteria.CriteriaStatus.values()*.name()}" required="" value="${approvalInstance?.status?.name()}" />

</div>

