<%@ page import="com.guru.connectframework.partnership.PartnershipLevel" %>



<div class="fieldcontain ${hasErrors(bean: partnershipLevelInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="partnershipLevel.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${partnershipLevelInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipLevelInstance, field: 'urlToDoc', 'error')} ">
	<label for="urlToDoc">
		<g:message code="partnershipLevel.urlToDoc.label" default="Url To Doc" />
		
	</label>
	<g:textField name="urlToDoc" value="${partnershipLevelInstance?.urlToDoc}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipLevelInstance, field: 'criteriaContainer', 'error')} required">
	<label for="criteriaContainer">
		<g:message code="partnershipLevel.criteriaContainer.label" default="Criteria Container" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="criteriaContainer" name="criteriaContainer.id" from="${com.guru.connectframework.criteria.CriteriaContainer.list()}" optionKey="id" required="" value="${partnershipLevelInstance?.criteriaContainer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipLevelInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="partnershipLevel.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" value="${partnershipLevelInstance.level}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: partnershipLevelInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="partnershipLevel.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${partnershipLevelInstance?.name}"/>

</div>

