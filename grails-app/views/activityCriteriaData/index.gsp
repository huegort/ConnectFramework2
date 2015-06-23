
<%@ page import="com.guru.connectframework.activity.ActivityCriteriaData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityCriteriaData.label', default: 'ActivityCriteriaData')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activityCriteriaData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activityCriteriaData" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="activityCriteriaData.activity.label" default="Activity" /></th>
					
						<th><g:message code="activityCriteriaData.approvedBy.label" default="Approved By" /></th>
					
						<th><g:message code="activityCriteriaData.associatedCriteria.label" default="Associated Criteria" /></th>
					
						<g:sortableColumn property="created" title="${message(code: 'activityCriteriaData.created.label', default: 'Created')}" />
					
						<g:sortableColumn property="dataApproved" title="${message(code: 'activityCriteriaData.dataApproved.label', default: 'Data Approved')}" />
					
						<g:sortableColumn property="dateData" title="${message(code: 'activityCriteriaData.dateData.label', default: 'Date Data')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityCriteriaDataInstanceList}" status="i" var="activityCriteriaDataInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityCriteriaDataInstance.id}">${fieldValue(bean: activityCriteriaDataInstance, field: "activity")}</g:link></td>
					
						<td>${fieldValue(bean: activityCriteriaDataInstance, field: "approvedBy")}</td>
					
						<td>${fieldValue(bean: activityCriteriaDataInstance, field: "associatedCriteria")}</td>
					
						<td><g:formatDate date="${activityCriteriaDataInstance.created}" /></td>
					
						<td><g:formatDate date="${activityCriteriaDataInstance.dataApproved}" /></td>
					
						<td><g:formatDate date="${activityCriteriaDataInstance.dateData}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityCriteriaDataInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
