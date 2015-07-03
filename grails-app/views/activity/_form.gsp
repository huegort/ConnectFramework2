<%@ page import="com.guru.connectframework.activity.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="activity.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${activityInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'contact', 'error')} ">
	<label for="contact">
		<g:message code="activity.contact.label" default="Contact" />
		
	</label>
	<g:select id="contact" name="contact.id" from="${com.guru.connectframework.institution.Contact.list()}" optionKey="id" value="${activityInstance?.contact?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'activityType', 'error')} required">
	<label for="activityType">
		<g:message code="activity.activityType.label" default="Activity Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activityType" name="activityType.id" from="${com.guru.connectframework.activity.ActivityType.list()}" optionKey="id" required="" value="${activityInstance?.activityType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'agreementTemplate', 'error')} required">
	<label for="agreementTemplate">
		<g:message code="activity.agreementTemplate.label" default="Agreement Template" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="agreementTemplate" name="agreementTemplate.id" from="${com.guru.connectframework.Document.list()}" optionKey="id" required="" value="${activityInstance?.agreementTemplate?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'approval', 'error')} required">
	<label for="approval">
		<g:message code="activity.approval.label" default="Approval" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="approval" name="approval.id" from="${com.guru.connectframework.criteria.Approval.list()}" optionKey="id" required="" value="${activityInstance?.approval?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'current', 'error')} ">
	<label for="current">
		<g:message code="activity.current.label" default="Current" />
		
	</label>
	<g:checkBox name="current" value="${activityInstance?.current}" />

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'dataContainer', 'error')} required">
	<label for="dataContainer">
		<g:message code="activity.dataContainer.label" default="Data Container" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dataContainer" name="dataContainer.id" from="${com.guru.connectframework.criteria.CriteriaDataContainer.list()}" optionKey="id" required="" value="${activityInstance?.dataContainer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'finalAgreement', 'error')} required">
	<label for="finalAgreement">
		<g:message code="activity.finalAgreement.label" default="Final Agreement" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="finalAgreement" name="finalAgreement.id" from="${com.guru.connectframework.Document.list()}" optionKey="id" required="" value="${activityInstance?.finalAgreement?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activity.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="activity.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${activityInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'partnership', 'error')} required">
	<label for="partnership">
		<g:message code="activity.partnership.label" default="Partnership" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="partnership" name="partnership.id" from="${com.guru.connectframework.partnership.Partnership.list()}" optionKey="id" required="" value="${activityInstance?.partnership?.id}" class="many-to-one"/>

</div>

