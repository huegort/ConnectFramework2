
<%@ page import="com.guru.connectframework.util.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-document" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="document.createdBy.label" default="Created By" /></th>
					
						<g:sortableColumn property="document" title="${message(code: 'document.document.label', default: 'Document')}" />
					
						<g:sortableColumn property="file" title="${message(code: 'document.file.label', default: 'File')}" />
					
						<g:sortableColumn property="fileType" title="${message(code: 'document.fileType.label', default: 'File Type')}" />
					
						<g:sortableColumn property="size" title="${message(code: 'document.size.label', default: 'Size')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentInstanceList}" status="i" var="documentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "createdBy")}</g:link></td>
					
						<td>${fieldValue(bean: documentInstance, field: "document")}</td>
					
						<td>${fieldValue(bean: documentInstance, field: "file")}</td>
					
						<td>${fieldValue(bean: documentInstance, field: "fileType")}</td>
					
						<td>${fieldValue(bean: documentInstance, field: "size")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
