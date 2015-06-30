
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
					
						<g:sortableColumn property="notes" title="${message(code: 'approval.notes.label', default: 'Notes')}" />
					
						<th><g:message code="approval.approvedBy.label" default="Approved By" /></th>
					
						<g:sortableColumn property="created" title="${message(code: 'approval.created.label', default: 'Created')}" />
					
						<th><g:message code="approval.createdBy.label" default="Created By" /></th>
					
						<g:sortableColumn property="dateApproved" title="${message(code: 'approval.dateApproved.label', default: 'Date Approved')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'approval.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${approvalInstanceList}" status="i" var="approvalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${approvalInstance.id}">${fieldValue(bean: approvalInstance, field: "notes")}</g:link></td>
					
						<td>${fieldValue(bean: approvalInstance, field: "approvedBy")}</td>
					
						<td><g:formatDate date="${approvalInstance.created}" /></td>
					
						<td>${fieldValue(bean: approvalInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${approvalInstance.dateApproved}" /></td>
					
						<td>${fieldValue(bean: approvalInstance, field: "status")}</td>
					
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