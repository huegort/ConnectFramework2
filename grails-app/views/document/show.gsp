
<%@ page import="com.guru.connectframework.util.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-document" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list document">
			
				<g:if test="${documentInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="document.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${documentInstance?.createdBy?.id}">${documentInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.document}">
				<li class="fieldcontain">
					<span id="document-label" class="property-label"><g:message code="document.document.label" default="Document" /></span>
					
						<span class="property-value" aria-labelledby="document-label"><g:fieldValue bean="${documentInstance}" field="document"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.file}">
				<li class="fieldcontain">
					<span id="file-label" class="property-label"><g:message code="document.file.label" default="File" /></span>
					
						<span class="property-value" aria-labelledby="file-label"><g:fieldValue bean="${documentInstance}" field="file"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.fileType}">
				<li class="fieldcontain">
					<span id="fileType-label" class="property-label"><g:message code="document.fileType.label" default="File Type" /></span>
					
						<span class="property-value" aria-labelledby="fileType-label"><g:fieldValue bean="${documentInstance}" field="fileType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="document.size.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${documentInstance}" field="size"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:documentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${documentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
