
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
					
						<g:sortableColumn property="description" title="${message(code: 'activity.description.label', default: 'Description')}" />
					
						<th><g:message code="activity.contact.label" default="Contact" /></th>
					
						<th><g:message code="activity.activityType.label" default="Activity Type" /></th>
					
						<th><g:message code="activity.agreementTemplate.label" default="Agreement Template" /></th>
					
						<th><g:message code="activity.approval.label" default="Approval" /></th>
					
						<g:sortableColumn property="current" title="${message(code: 'activity.current.label', default: 'Current')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityInstanceList}" status="i" var="activityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: activityInstance, field: "contact")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "activityType")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "agreementTemplate")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "approval")}</td>
					
						<td><g:formatBoolean boolean="${activityInstance.current}" /></td>
					
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
