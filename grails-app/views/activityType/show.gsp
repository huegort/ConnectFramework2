
<%@ page import="com.guru.connectframework.Activity.ActivityType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityType.label', default: 'ActivityType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activityType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activityType">
			
				<g:if test="${activityTypeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="activityType.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${activityTypeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.urlToDoc}">
				<li class="fieldcontain">
					<span id="urlToDoc-label" class="property-label"><g:message code="activityType.urlToDoc.label" default="Url To Doc" /></span>
					
						<span class="property-value" aria-labelledby="urlToDoc-label"><g:fieldValue bean="${activityTypeInstance}" field="urlToDoc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.document}">
				<li class="fieldcontain">
					<span id="document-label" class="property-label"><g:message code="activityType.document.label" default="Document" /></span>
					
						<span class="property-value" aria-labelledby="document-label"><g:link controller="document" action="show" id="${activityTypeInstance?.document?.id}">${activityTypeInstance?.document?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="activityType.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="activityCategory" action="show" id="${activityTypeInstance?.category?.id}">${activityTypeInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.criteriaContainer}">
				<li class="fieldcontain">
					<span id="criteriaContainer-label" class="property-label"><g:message code="activityType.criteriaContainer.label" default="Criteria Container" /></span>
					
						<span class="property-value" aria-labelledby="criteriaContainer-label"><g:link controller="criteriaContainer" action="show" id="${activityTypeInstance?.criteriaContainer?.id}">${activityTypeInstance?.criteriaContainer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="activityType.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${activityTypeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.requiredLevel}">
				<li class="fieldcontain">
					<span id="requiredLevel-label" class="property-label"><g:message code="activityType.requiredLevel.label" default="Required Level" /></span>
					
						<span class="property-value" aria-labelledby="requiredLevel-label"><g:link controller="partnershipLevel" action="show" id="${activityTypeInstance?.requiredLevel?.id}">${activityTypeInstance?.requiredLevel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:activityTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${activityTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
