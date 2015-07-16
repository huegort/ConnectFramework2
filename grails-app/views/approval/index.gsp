
<%@ page import="com.guru.connectframework.criteria.Approval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'approval.label', default: 'Approval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-approval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-approval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="notes" title="${message(code: 'approval.feedback.label', default: 'Notes')}" />
					
						<g:sortableColumn property="dateArchived" title="${message(code: 'approval.dateArchived.label', default: 'Date Archived')}" />
					
						<g:sortableColumn property="dateApproved" title="${message(code: 'approval.dateApproved.label', default: 'Date Approved')}" />
					
						<g:sortableColumn property="dateEndorsed" title="${message(code: 'approval.dateEndorsed.label', default: 'Date Endorsed')}" />
					
						<g:sortableColumn property="validTo" title="${message(code: 'approval.validTo.label', default: 'Valid To')}" />
					
						<th><g:message code="approval.approver.label" default="Approver" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${approvalInstanceList}" status="i" var="approvalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${approvalInstance.id}">${fieldValue(bean: approvalInstance, field: "feedback")}</g:link></td>
					
						<td><g:formatDate date="${approvalInstance.dateArchived}" /></td>
					
						<td><g:formatDate date="${approvalInstance.dateApproved}" /></td>
					
						<td><g:formatDate date="${approvalInstance.dateEndorsed}" /></td>
					
						<td><g:formatDate date="${approvalInstance.validTo}" /></td>
					
						<td>${fieldValue(bean: approvalInstance, field: "approver")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${approvalInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
