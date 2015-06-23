
<%@ page import="com.guru.connectframework.activity.ActivityCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityCriteria.label', default: 'ActivityCriteria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activityCriteria" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activityCriteria">
			
				<g:if test="${activityCriteriaInstance?.activityType}">
				<li class="fieldcontain">
					<span id="activityType-label" class="property-label"><g:message code="activityCriteria.activityType.label" default="Activity Type" /></span>
					
						<span class="property-value" aria-labelledby="activityType-label"><g:link controller="activityType" action="show" id="${activityCriteriaInstance?.activityType?.id}">${activityCriteriaInstance?.activityType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="activityCriteria.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${activityCriteriaInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaInstance?.sequenceNumber}">
				<li class="fieldcontain">
					<span id="sequenceNumber-label" class="property-label"><g:message code="activityCriteria.sequenceNumber.label" default="Sequence Number" /></span>
					
						<span class="property-value" aria-labelledby="sequenceNumber-label"><g:fieldValue bean="${activityCriteriaInstance}" field="sequenceNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="activityCriteria.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${activityCriteriaInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:activityCriteriaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${activityCriteriaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
