
<%@ page import="com.guru.connectframework.activity.ActivityType" %>
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
			
				<g:if test="${activityTypeInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="activityType.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="activityCategory" action="show" id="${activityTypeInstance?.category?.id}">${activityTypeInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.criteria}">
				<li class="fieldcontain">
					<span id="criteria-label" class="property-label"><g:message code="activityType.criteria.label" default="Criteria" /></span>
					
						<g:each in="${activityTypeInstance.criteria}" var="c">
						<span class="property-value" aria-labelledby="criteria-label"><g:link controller="activityCriteria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.descritption}">
				<li class="fieldcontain">
					<span id="descritption-label" class="property-label"><g:message code="activityType.descritption.label" default="Descritption" /></span>
					
						<span class="property-value" aria-labelledby="descritption-label"><g:fieldValue bean="${activityTypeInstance}" field="descritption"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.explainationURL}">
				<li class="fieldcontain">
					<span id="explainationURL-label" class="property-label"><g:message code="activityType.explainationURL.label" default="Explaination URL" /></span>
					
						<span class="property-value" aria-labelledby="explainationURL-label"><g:fieldValue bean="${activityTypeInstance}" field="explainationURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.levelRequired}">
				<li class="fieldcontain">
					<span id="levelRequired-label" class="property-label"><g:message code="activityType.levelRequired.label" default="Level Required" /></span>
					
						<span class="property-value" aria-labelledby="levelRequired-label"><g:link controller="partnershipLevel" action="show" id="${activityTypeInstance?.levelRequired?.id}">${activityTypeInstance?.levelRequired?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTypeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="activityType.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${activityTypeInstance}" field="name"/></span>
					
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
