
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
			
				<g:if test="${activityInstance?.approver}">
				<li class="fieldcontain">
					<span id="approver-label" class="property-label"><g:message code="activity.approver.label" default="Approver" /></span>
					
						<span class="property-value" aria-labelledby="approver-label"><g:link controller="user" action="show" id="${activityInstance?.approver?.id}">${activityInstance?.approver?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="activity.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:formatDate date="${activityInstance?.created}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.criteriaData}">
				<li class="fieldcontain">
					<span id="criteriaData-label" class="property-label"><g:message code="activity.criteriaData.label" default="Criteria Data" /></span>
					
						<g:each in="${activityInstance.criteriaData}" var="c">
						<span class="property-value" aria-labelledby="criteriaData-label"><g:link controller="activityCriteriaData" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.dateApproved}">
				<li class="fieldcontain">
					<span id="dateApproved-label" class="property-label"><g:message code="activity.dateApproved.label" default="Date Approved" /></span>
					
						<span class="property-value" aria-labelledby="dateApproved-label"><g:formatDate date="${activityInstance?.dateApproved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.institution}">
				<li class="fieldcontain">
					<span id="institution-label" class="property-label"><g:message code="activity.institution.label" default="Institution" /></span>
					
						<span class="property-value" aria-labelledby="institution-label"><g:link controller="institution" action="show" id="${activityInstance?.institution?.id}">${activityInstance?.institution?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="activity.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${activityInstance?.owner?.id}">${activityInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="activity.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${activityInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="activity.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="activityType" action="show" id="${activityInstance?.type?.id}">${activityInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.validUntil}">
				<li class="fieldcontain">
					<span id="validUntil-label" class="property-label"><g:message code="activity.validUntil.label" default="Valid Until" /></span>
					
						<span class="property-value" aria-labelledby="validUntil-label"><g:formatDate date="${activityInstance?.validUntil}" /></span>
					
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
