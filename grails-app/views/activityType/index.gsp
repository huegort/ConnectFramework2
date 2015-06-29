
<%@ page import="com.guru.connectframework.Activity.ActivityType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityType.label', default: 'ActivityType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activityType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activityType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'activityType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="urlToDoc" title="${message(code: 'activityType.urlToDoc.label', default: 'Url To Doc')}" />
					
						<th><g:message code="activityType.document.label" default="Document" /></th>
					
						<th><g:message code="activityType.category.label" default="Category" /></th>
					
						<th><g:message code="activityType.criteriaContainer.label" default="Criteria Container" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'activityType.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityTypeInstanceList}" status="i" var="activityTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityTypeInstance.id}">${fieldValue(bean: activityTypeInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: activityTypeInstance, field: "urlToDoc")}</td>
					
						<td>${fieldValue(bean: activityTypeInstance, field: "document")}</td>
					
						<td>${fieldValue(bean: activityTypeInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: activityTypeInstance, field: "criteriaContainer")}</td>
					
						<td>${fieldValue(bean: activityTypeInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
