<%@ page import="com.guru.connectframework.activity.ActivityType" %>



<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="activityType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${activityTypeInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'urlToDoc', 'error')} ">
	<label for="urlToDoc">
		<g:message code="activityType.urlToDoc.label" default="Url To Doc" />
		
	</label>
	<g:textField name="urlToDoc" value="${activityTypeInstance?.urlToDoc}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'document', 'error')} ">
	<label for="document">
		<g:message code="activityType.document.label" default="Document" />
		
	</label>
	<g:select id="document" name="document.id" from="${com.guru.connectframework.util.Document.list()}" optionKey="id" value="${activityTypeInstance?.document?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="activityType.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.guru.connectframework.activity.ActivityCategory.list()}" optionKey="id" required="" value="${activityTypeInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'criteriaContainer', 'error')} required">
	<label for="criteriaContainer">
		<g:message code="activityType.criteriaContainer.label" default="Criteria Container" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="criteriaContainer" name="criteriaContainer.id" from="${com.guru.connectframework.criteria.CriteriaContainer.list()}" optionKey="id" required="" value="${activityTypeInstance?.criteriaContainer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activityType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityTypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'requiredLevel', 'error')} required">
	<label for="requiredLevel">
		<g:message code="activityType.requiredLevel.label" default="Required Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="requiredLevel" name="requiredLevel.id" from="${com.guru.connectframework.partnership.PartnershipLevel.list()}" optionKey="id" required="" value="${activityTypeInstance?.requiredLevel?.id}" class="many-to-one"/>

</div>

