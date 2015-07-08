
<%@ page import="com.guru.connectframework.partnership.Partnership" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partnership.label', default: 'Partnership')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-partnership" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-partnership" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list partnership">
			
				<g:if test="${partnershipInstance?.contact}">
				<li class="fieldcontain">
					<span id="contact-label" class="property-label"><g:message code="partnership.contact.label" default="Contact" /></span>
					
						<span class="property-value" aria-labelledby="contact-label"><g:link controller="contact" action="show" id="${partnershipInstance?.contact?.id}">${partnershipInstance?.contact?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipInstance?.activities}">
				<li class="fieldcontain">
					<span id="activities-label" class="property-label"><g:message code="partnership.activities.label" default="Activities" /></span>
					
						<g:each in="${partnershipInstance.activities}" var="a">
						<span class="property-value" aria-labelledby="activities-label"><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="partnership.approval.label" default="Approval" /></span>
					
						<span class="property-value" aria-labelledby="approval-label"><g:link controller="approval" action="show" id="${partnershipInstance?.approval?.id}">${partnershipInstance?.approval?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipInstance?.dataContainer}">
				<li class="fieldcontain">
					<span id="dataContainer-label" class="property-label"><g:message code="partnership.dataContainer.label" default="Data Container" /></span>
					
						<span class="property-value" aria-labelledby="dataContainer-label"><g:link controller="criteriaDataContainer" action="show" id="${partnershipInstance?.dataContainer?.id}">${partnershipInstance?.dataContainer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipInstance?.institution}">
				<li class="fieldcontain">
					<span id="institution-label" class="property-label"><g:message code="partnership.institution.label" default="Institution" /></span>
					
						<span class="property-value" aria-labelledby="institution-label"><g:link controller="institution" action="show" id="${partnershipInstance?.institution?.id}">${partnershipInstance?.institution?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="partnership.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${partnershipInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="partnership.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${partnershipInstance?.owner?.id}">${partnershipInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partnershipInstance?.partnershipLevel}">
				<li class="fieldcontain">
					<span id="partnershipLevel-label" class="property-label"><g:message code="partnership.partnershipLevel.label" default="Partnership Level" /></span>
					
						<span class="property-value" aria-labelledby="partnershipLevel-label"><g:link controller="partnershipLevel" action="show" id="${partnershipInstance?.partnershipLevel?.id}">${partnershipInstance?.partnershipLevel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:partnershipInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${partnershipInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
