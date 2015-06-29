
<%@ page import="com.guru.connectframework.criteria.CriteriaData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'criteriaData.label', default: 'CriteriaData')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-criteriaData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-criteriaData" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="valueString" title="${message(code: 'criteriaData.valueString.label', default: 'Value String')}" />
					
						<th><g:message code="criteriaData.valueDocument.label" default="Value Document" /></th>
					
						<g:sortableColumn property="valueDate" title="${message(code: 'criteriaData.valueDate.label', default: 'Value Date')}" />
					
						<th><g:message code="criteriaData.approval.label" default="Approval" /></th>
					
						<th><g:message code="criteriaData.container.label" default="Container" /></th>
					
						<th><g:message code="criteriaData.criteria.label" default="Criteria" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${criteriaDataInstanceList}" status="i" var="criteriaDataInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${criteriaDataInstance.id}">${fieldValue(bean: criteriaDataInstance, field: "valueString")}</g:link></td>
					
						<td>${fieldValue(bean: criteriaDataInstance, field: "valueDocument")}</td>
					
						<td><g:formatDate date="${criteriaDataInstance.valueDate}" /></td>
					
						<td>${fieldValue(bean: criteriaDataInstance, field: "approval")}</td>
					
						<td>${fieldValue(bean: criteriaDataInstance, field: "container")}</td>
					
						<td>${fieldValue(bean: criteriaDataInstance, field: "criteria")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${criteriaDataInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
