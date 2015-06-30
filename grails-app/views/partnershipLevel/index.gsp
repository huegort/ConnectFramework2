
<%@ page import="com.guru.connectframework.partnership.PartnershipLevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partnershipLevel.label', default: 'PartnershipLevel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-partnershipLevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-partnershipLevel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'partnershipLevel.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="urlToDoc" title="${message(code: 'partnershipLevel.urlToDoc.label', default: 'Url To Doc')}" />
					
						<th><g:message code="partnershipLevel.criteriaContainer.label" default="Criteria Container" /></th>
					
						<g:sortableColumn property="level" title="${message(code: 'partnershipLevel.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'partnershipLevel.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${partnershipLevelInstanceList}" status="i" var="partnershipLevelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${partnershipLevelInstance.id}">${fieldValue(bean: partnershipLevelInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: partnershipLevelInstance, field: "urlToDoc")}</td>
					
						<td>${fieldValue(bean: partnershipLevelInstance, field: "criteriaContainer")}</td>
					
						<td>${fieldValue(bean: partnershipLevelInstance, field: "level")}</td>
					
						<td>${fieldValue(bean: partnershipLevelInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${partnershipLevelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
