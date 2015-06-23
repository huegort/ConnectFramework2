
<%@ page import="com.guru.connectframework.activity.Activity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="activity.approver.label" default="Approver" /></th>
					
						<g:sortableColumn property="created" title="${message(code: 'activity.created.label', default: 'Created')}" />
					
						<g:sortableColumn property="dateApproved" title="${message(code: 'activity.dateApproved.label', default: 'Date Approved')}" />
					
						<th><g:message code="activity.institution.label" default="Institution" /></th>
					
						<th><g:message code="activity.owner.label" default="Owner" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'activity.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityInstanceList}" status="i" var="activityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "approver")}</g:link></td>
					
						<td><g:formatDate date="${activityInstance.created}" /></td>
					
						<td><g:formatDate date="${activityInstance.dateApproved}" /></td>
					
						<td>${fieldValue(bean: activityInstance, field: "institution")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "owner")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
