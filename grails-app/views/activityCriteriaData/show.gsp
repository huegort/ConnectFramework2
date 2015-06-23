
<%@ page import="com.guru.connectframework.activity.ActivityCriteriaData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityCriteriaData.label', default: 'ActivityCriteriaData')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityCriteriaData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activityCriteriaData" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activityCriteriaData">
			
				<g:if test="${activityCriteriaDataInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="activityCriteriaData.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${activityCriteriaDataInstance?.activity?.id}">${activityCriteriaDataInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaDataInstance?.approvedBy}">
				<li class="fieldcontain">
					<span id="approvedBy-label" class="property-label"><g:message code="activityCriteriaData.approvedBy.label" default="Approved By" /></span>
					
						<span class="property-value" aria-labelledby="approvedBy-label"><g:link controller="user" action="show" id="${activityCriteriaDataInstance?.approvedBy?.id}">${activityCriteriaDataInstance?.approvedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaDataInstance?.associatedCriteria}">
				<li class="fieldcontain">
					<span id="associatedCriteria-label" class="property-label"><g:message code="activityCriteriaData.associatedCriteria.label" default="Associated Criteria" /></span>
					
						<span class="property-value" aria-labelledby="associatedCriteria-label"><g:link controller="activityCriteria" action="show" id="${activityCriteriaDataInstance?.associatedCriteria?.id}">${activityCriteriaDataInstance?.associatedCriteria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaDataInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="activityCriteriaData.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:formatDate date="${activityCriteriaDataInstance?.created}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaDataInstance?.dataApproved}">
				<li class="fieldcontain">
					<span id="dataApproved-label" class="property-label"><g:message code="activityCriteriaData.dataApproved.label" default="Data Approved" /></span>
					
						<span class="property-value" aria-labelledby="dataApproved-label"><g:formatDate date="${activityCriteriaDataInstance?.dataApproved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaDataInstance?.dateData}">
				<li class="fieldcontain">
					<span id="dateData-label" class="property-label"><g:message code="activityCriteriaData.dateData.label" default="Date Data" /></span>
					
						<span class="property-value" aria-labelledby="dateData-label"><g:formatDate date="${activityCriteriaDataInstance?.dateData}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaDataInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="activityCriteriaData.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${activityCriteriaDataInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaDataInstance?.stringData}">
				<li class="fieldcontain">
					<span id="stringData-label" class="property-label"><g:message code="activityCriteriaData.stringData.label" default="String Data" /></span>
					
						<span class="property-value" aria-labelledby="stringData-label"><g:fieldValue bean="${activityCriteriaDataInstance}" field="stringData"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCriteriaDataInstance?.validUntil}">
				<li class="fieldcontain">
					<span id="validUntil-label" class="property-label"><g:message code="activityCriteriaData.validUntil.label" default="Valid Until" /></span>
					
						<span class="property-value" aria-labelledby="validUntil-label"><g:formatDate date="${activityCriteriaDataInstance?.validUntil}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:activityCriteriaDataInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${activityCriteriaDataInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
