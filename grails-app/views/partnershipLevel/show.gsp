
<%@ page import="com.guru.connectframework.partnership.PartnershipLevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partnershipLevel.label', default: 'PartnershipLevel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-partnershipLevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-partnershipLevel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list partnershipLevel">
			
				<g:if test="${partnershipLevelInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="partnershipLevel.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${partnershipLevelInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipLevelInstance?.urlToDoc}">
				<li class="fieldcontain">
					<span id="urlToDoc-label" class="property-label"><g:message code="partnershipLevel.urlToDoc.label" default="Url To Doc" /></span>
					
						<span class="property-value" aria-labelledby="urlToDoc-label"><g:fieldValue bean="${partnershipLevelInstance}" field="urlToDoc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipLevelInstance?.criteriaContainer}">
				<li class="fieldcontain">
					<span id="criteriaContainer-label" class="property-label"><g:message code="partnershipLevel.criteriaContainer.label" default="Criteria Container" /></span>
					
						<span class="property-value" aria-labelledby="criteriaContainer-label"><g:link controller="criteriaContainer" action="show" id="${partnershipLevelInstance?.criteriaContainer?.id}">${partnershipLevelInstance?.criteriaContainer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipLevelInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="partnershipLevel.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${partnershipLevelInstance}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipLevelInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="partnershipLevel.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${partnershipLevelInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:partnershipLevelInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${partnershipLevelInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
