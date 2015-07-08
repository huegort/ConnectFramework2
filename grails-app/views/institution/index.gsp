
<%@ page import="com.guru.connectframework.institution.Institution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-institution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-institution" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'institution.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'institution.notes.label', default: 'Notes')}" />
					
						<th><g:message code="institution.currentHighest.label" default="Current Highest" /></th>
					
						<g:sortableColumn property="address1" title="${message(code: 'institution.address1.label', default: 'Address1')}" />
					
						<g:sortableColumn property="address2" title="${message(code: 'institution.address2.label', default: 'Address2')}" />
					
						<g:sortableColumn property="provence" title="${message(code: 'institution.provence.label', default: 'Provence')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${institutionInstanceList}" status="i" var="institutionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${institutionInstance.id}">${fieldValue(bean: institutionInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: institutionInstance, field: "notes")}</td>
					
						<td>${fieldValue(bean: institutionInstance, field: "currentHighest")}</td>
					
						<td>${fieldValue(bean: institutionInstance, field: "address1")}</td>
					
						<td>${fieldValue(bean: institutionInstance, field: "address2")}</td>
					
						<td>${fieldValue(bean: institutionInstance, field: "provence")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${institutionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
