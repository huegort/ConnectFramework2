
<%@ page import="com.guru.connectframework.criteria.CriteriaData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'criteriaData.label', default: 'CriteriaData')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-criteriaData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-criteriaData" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list criteriaData">
			
				<g:if test="${criteriaDataInstance?.valueString}">
				<li class="fieldcontain">
					<span id="valueString-label" class="property-label"><g:message code="criteriaData.valueString.label" default="Value String" /></span>
					
						<span class="property-value" aria-labelledby="valueString-label"><g:fieldValue bean="${criteriaDataInstance}" field="valueString"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${criteriaDataInstance?.valueDocument}">
				<li class="fieldcontain">
					<span id="valueDocument-label" class="property-label"><g:message code="criteriaData.valueDocument.label" default="Value Document" /></span>
					
						<span class="property-value" aria-labelledby="valueDocument-label"><g:link controller="document" action="show" id="${criteriaDataInstance?.valueDocument?.id}">${criteriaDataInstance?.valueDocument?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${criteriaDataInstance?.valueDate}">
				<li class="fieldcontain">
					<span id="valueDate-label" class="property-label"><g:message code="criteriaData.valueDate.label" default="Value Date" /></span>
					
						<span class="property-value" aria-labelledby="valueDate-label"><g:formatDate date="${criteriaDataInstance?.valueDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${criteriaDataInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="criteriaData.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${criteriaDataInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${criteriaDataInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="criteriaData.approval.label" default="Approval" /></span>
					
						<span class="property-value" aria-labelledby="approval-label"><g:link controller="approval" action="show" id="${criteriaDataInstance?.approval?.id}">${criteriaDataInstance?.approval?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${criteriaDataInstance?.container}">
				<li class="fieldcontain">
					<span id="container-label" class="property-label"><g:message code="criteriaData.container.label" default="Container" /></span>
					
						<span class="property-value" aria-labelledby="container-label"><g:link controller="criteriaDataContainer" action="show" id="${criteriaDataInstance?.container?.id}">${criteriaDataInstance?.container?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${criteriaDataInstance?.criteria}">
				<li class="fieldcontain">
					<span id="criteria-label" class="property-label"><g:message code="criteriaData.criteria.label" default="Criteria" /></span>
					
						<span class="property-value" aria-labelledby="criteria-label"><g:link controller="criteria" action="show" id="${criteriaDataInstance?.criteria?.id}">${criteriaDataInstance?.criteria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:criteriaDataInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${criteriaDataInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
