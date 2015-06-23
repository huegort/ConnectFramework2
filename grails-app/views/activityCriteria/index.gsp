
<%@ page import="com.guru.connectframework.activity.ActivityCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityCriteria.label', default: 'ActivityCriteria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activityCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activityCriteria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="activityCriteria.activityType.label" default="Activity Type" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'activityCriteria.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="sequenceNumber" title="${message(code: 'activityCriteria.sequenceNumber.label', default: 'Sequence Number')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'activityCriteria.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityCriteriaInstanceList}" status="i" var="activityCriteriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityCriteriaInstance.id}">${fieldValue(bean: activityCriteriaInstance, field: "activityType")}</g:link></td>
					
						<td>${fieldValue(bean: activityCriteriaInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: activityCriteriaInstance, field: "sequenceNumber")}</td>
					
						<td>${fieldValue(bean: activityCriteriaInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityCriteriaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
