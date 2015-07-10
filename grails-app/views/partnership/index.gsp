
<%@ page import="com.guru.connectframework.partnership.Partnership" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partnership.label', default: 'Partnership')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-partnership" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-partnership" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'partnership.name.label', default: 'Name')}" />

						<th><g:message code="partnership.contact.label" default="Contact" /></th>
					
						<th><g:message code="partnership.approval.label" default="Approval" /></th>

						<th><g:message code="partnership.dataContainer.label" default="Data Container" /></th>
					
						<th><g:message code="partnership.institution.label" default="Institution" /></th>
					

						<th><g:message code="partnership.owner.label" default="Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${partnershipInstanceList}" status="i" var="partnershipInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link controller="CfApproval" action="approvePartnership" params="[partnershipId : ${fieldValue(bean: partnershipInstance, field: "id")}"></g:link>  ${fieldValue(bean: partnershipInstance, field: "name")}</td>


						<td><g:link action="show" id="${partnershipInstance.id}">${fieldValue(bean: partnershipInstance, field: "contact")}</g:link></td>
					
						<td>${fieldValue(bean: partnershipInstance, field: "approval")}</td>

						<td>${fieldValue(bean: partnershipInstance, field: "dataContainer")}</td>
					
						<td>${fieldValue(bean: partnershipInstance, field: "institution")}</td>
					

						<td>${fieldValue(bean: partnershipInstance, field: "owner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${partnershipInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
