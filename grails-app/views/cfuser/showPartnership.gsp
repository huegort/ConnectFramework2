<%--
  Created by IntelliJ IDEA.
  User: lmanuelcb
  Date: 07/10/2015
  Time: 11:25
--%>

<%@ page import="com.guru.connectframework.partnership.Partnership" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap">
</head>

<body>
<div class="main-body">

    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <h1><g:message code="default.show.label" args="[entityName = 'Partnership']"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
        </div>
    </div>

    <div class="grid">
        <div class="grid__col grid__col--10-of-12">
            <ol class="property-list partnership">

                <g:if test="${partnershipInstance?.contact}">
                    <li class="fieldcontain">
                        <span id="contact-label" class="property-label"><g:message code="partnership.contact.label" default="Contact" /></span>

                        <span class="property-value" aria-labelledby="contact-label"><g:link controller="contact" action="show" id="${partnershipInstance?.contact?.id}">${partnershipInstance?.contact?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${partnershipInstance?.activities}">
                    <li class="fieldcontain">
                        <span id="activities-label" class="property-label"><g:message code="partnership.activities.label" default="Activities" /></span>

                        <g:each in="${partnershipInstance.activities}" var="a">
                            <span class="property-value" aria-labelledby="activities-label"><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                        </g:each>

                    </li>
                </g:if>

                <g:if test="${partnershipInstance?.approval}">
                    <li class="fieldcontain">
                        <span id="approval-label" class="property-label"><g:message code="partnership.approval.label" default="Approval" /></span>

                        <span class="property-value" aria-labelledby="approval-label"><g:link controller="approval" action="show" id="${partnershipInstance?.approval?.id}">${partnershipInstance?.approval?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${partnershipInstance?.institution}">
                    <li class="fieldcontain">
                        <span id="institution-label" class="property-label"><g:message code="partnership.institution.label" default="Institution" /></span>

                        <span class="property-value" aria-labelledby="institution-label"><g:link controller="institution" action="show" id="${partnershipInstance?.institution?.id}">${partnershipInstance?.institution?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${partnershipInstance?.name}">
                    <li class="fieldcontain">
                        <span id="name-label" class="property-label"><g:message code="partnership.name.label" default="Name" /></span>

                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${partnershipInstance}" field="name"/></span>

                    </li>
                </g:if>

                <g:if test="${partnershipInstance?.owner}">
                    <li class="fieldcontain">
                        <span id="owner-label" class="property-label"><g:message code="partnership.owner.label" default="Owner" /></span>

                        <span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${partnershipInstance?.owner?.id}">${partnershipInstance?.owner?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${partnershipInstance?.partnershipLevel}">
                    <li class="fieldcontain">
                        <span id="partnershipLevel-label" class="property-label"><g:message code="partnership.partnershipLevel.label" default="Partnership Level" /></span>

                        <span class="property-value" aria-labelledby="partnershipLevel-label"><g:link controller="partnershipLevel" action="show" id="${partnershipInstance?.partnershipLevel?.id}">${partnershipInstance?.partnershipLevel?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

            </ol>
        </div>
    </div>

    <div class="grid__col grid__col--2-of-12"></div>

    <nav>
        <ul class="pager">
            <li class="previous"><a href="${createLink(uri: '/cfuser/home')}"><span aria-hidden="true">&larr;</span> Go Back</a></li>
        </ul>
    </nav>
</div>

</body>
</html>