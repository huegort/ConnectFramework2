
<%@ page import="com.guru.connectframework.criteria.Approval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'approval.label', default: 'Approval')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-approval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-approval" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list approval">
			
				<g:if test="${approvalInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="approval.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${approvalInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.approver}">
				<li class="fieldcontain">
					<span id="approver-label" class="property-label"><g:message code="approval.approver.label" default="Approver" /></span>
					
						<span class="property-value" aria-labelledby="approver-label"><g:link controller="user" action="show" id="${approvalInstance?.approver?.id}">${approvalInstance?.approver?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="approval.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:formatDate date="${approvalInstance?.created}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="approval.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${approvalInstance?.createdBy?.id}">${approvalInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.dateApproved}">
				<li class="fieldcontain">
					<span id="dateApproved-label" class="property-label"><g:message code="approval.dateApproved.label" default="Date Approved" /></span>
					
						<span class="property-value" aria-labelledby="dateApproved-label"><g:formatDate date="${approvalInstance?.dateApproved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.dateEndorsed}">
				<li class="fieldcontain">
					<span id="dateEndorsed-label" class="property-label"><g:message code="approval.dateEndorsed.label" default="Date Endorsed" /></span>
					
						<span class="property-value" aria-labelledby="dateEndorsed-label"><g:formatDate date="${approvalInstance?.dateEndorsed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.endorser}">
				<li class="fieldcontain">
					<span id="endorser-label" class="property-label"><g:message code="approval.endorser.label" default="Endorser" /></span>
					
						<span class="property-value" aria-labelledby="endorser-label"><g:link controller="user" action="show" id="${approvalInstance?.endorser?.id}">${approvalInstance?.endorser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="approval.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${approvalInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.validTo}">
				<li class="fieldcontain">
					<span id="validTo-label" class="property-label"><g:message code="approval.validTo.label" default="Valid To" /></span>
					
						<span class="property-value" aria-labelledby="validTo-label"><g:formatDate date="${approvalInstance?.validTo}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:approvalInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${approvalInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
