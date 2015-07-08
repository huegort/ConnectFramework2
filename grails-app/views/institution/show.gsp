
<%@ page import="com.guru.connectframework.institution.Institution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-institution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-institution" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list institution">
			
				<g:if test="${institutionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="institution.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${institutionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="institution.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${institutionInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.currentHighest}">
				<li class="fieldcontain">
					<span id="currentHighest-label" class="property-label"><g:message code="institution.currentHighest.label" default="Current Highest" /></span>
					
						<span class="property-value" aria-labelledby="currentHighest-label"><g:link controller="partnership" action="show" id="${institutionInstance?.currentHighest?.id}">${institutionInstance?.currentHighest?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="institution.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${institutionInstance}" field="address1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.address2}">
				<li class="fieldcontain">
					<span id="address2-label" class="property-label"><g:message code="institution.address2.label" default="Address2" /></span>
					
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${institutionInstance}" field="address2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.provence}">
				<li class="fieldcontain">
					<span id="provence-label" class="property-label"><g:message code="institution.provence.label" default="Provence" /></span>
					
						<span class="property-value" aria-labelledby="provence-label"><g:fieldValue bean="${institutionInstance}" field="provence"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.postcode}">
				<li class="fieldcontain">
					<span id="postcode-label" class="property-label"><g:message code="institution.postcode.label" default="Postcode" /></span>
					
						<span class="property-value" aria-labelledby="postcode-label"><g:fieldValue bean="${institutionInstance}" field="postcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="institution.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:link controller="country" action="show" id="${institutionInstance?.country?.id}">${institutionInstance?.country?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="institution.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${institutionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:institutionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${institutionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
