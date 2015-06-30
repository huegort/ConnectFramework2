
<%@ page import="com.guru.connectframework.activity.Activity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activity">
			
				<g:if test="${activityInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="activity.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${activityInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.contact}">
				<li class="fieldcontain">
					<span id="contact-label" class="property-label"><g:message code="activity.contact.label" default="Contact" /></span>
					
						<span class="property-value" aria-labelledby="contact-label"><g:link controller="contact" action="show" id="${activityInstance?.contact?.id}">${activityInstance?.contact?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.activityType}">
				<li class="fieldcontain">
					<span id="activityType-label" class="property-label"><g:message code="activity.activityType.label" default="Activity Type" /></span>
					
						<span class="property-value" aria-labelledby="activityType-label"><g:link controller="activityType" action="show" id="${activityInstance?.activityType?.id}">${activityInstance?.activityType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.agreementTemplate}">
				<li class="fieldcontain">
					<span id="agreementTemplate-label" class="property-label"><g:message code="activity.agreementTemplate.label" default="Agreement Template" /></span>
					
						<span class="property-value" aria-labelledby="agreementTemplate-label"><g:link controller="document" action="show" id="${activityInstance?.agreementTemplate?.id}">${activityInstance?.agreementTemplate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="activity.approval.label" default="Approval" /></span>
					
						<span class="property-value" aria-labelledby="approval-label"><g:link controller="approval" action="show" id="${activityInstance?.approval?.id}">${activityInstance?.approval?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.current}">
				<li class="fieldcontain">
					<span id="current-label" class="property-label"><g:message code="activity.current.label" default="Current" /></span>
					
						<span class="property-value" aria-labelledby="current-label"><g:formatBoolean boolean="${activityInstance?.current}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.dataContainer}">
				<li class="fieldcontain">
					<span id="dataContainer-label" class="property-label"><g:message code="activity.dataContainer.label" default="Data Container" /></span>
					
						<span class="property-value" aria-labelledby="dataContainer-label"><g:link controller="criteriaDataContainer" action="show" id="${activityInstance?.dataContainer?.id}">${activityInstance?.dataContainer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.finalAgreement}">
				<li class="fieldcontain">
					<span id="finalAgreement-label" class="property-label"><g:message code="activity.finalAgreement.label" default="Final Agreement" /></span>
					
						<span class="property-value" aria-labelledby="finalAgreement-label"><g:link controller="document" action="show" id="${activityInstance?.finalAgreement?.id}">${activityInstance?.finalAgreement?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="activity.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${activityInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="activity.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${activityInstance?.owner?.id}">${activityInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.partnership}">
				<li class="fieldcontain">
					<span id="partnership-label" class="property-label"><g:message code="activity.partnership.label" default="Partnership" /></span>
					
						<span class="property-value" aria-labelledby="partnership-label"><g:link controller="partnership" action="show" id="${activityInstance?.partnership?.id}">${activityInstance?.partnership?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:activityInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${activityInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
