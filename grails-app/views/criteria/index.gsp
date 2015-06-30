
<%@ page import="com.guru.connectframework.criteria.Criteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'criteria.label', default: 'Criteria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-criteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-criteria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'criteria.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'criteria.notes.label', default: 'Notes')}" />
					
						<th><g:message code="criteria.container.label" default="Container" /></th>
					
						<g:sortableColumn property="dataType" title="${message(code: 'criteria.dataType.label', default: 'Data Type')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'criteria.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="sequenceNumber" title="${message(code: 'criteria.sequenceNumber.label', default: 'Sequence Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${criteriaInstanceList}" status="i" var="criteriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${criteriaInstance.id}">${fieldValue(bean: criteriaInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: criteriaInstance, field: "notes")}</td>
					
						<td>${fieldValue(bean: criteriaInstance, field: "container")}</td>
					
						<td>${fieldValue(bean: criteriaInstance, field: "dataType")}</td>
					
						<td>${fieldValue(bean: criteriaInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: criteriaInstance, field: "sequenceNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${criteriaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
