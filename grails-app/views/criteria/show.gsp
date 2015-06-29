<%@ page import="com.guru.connectframework.criteria.Criteria" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'criteria.label', default: 'Criteria')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-criteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-criteria" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list criteria">

        <g:if test="${criteriaInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="criteria.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                        bean="${criteriaInstance}" field="description"/></span>

            </li>
        </g:if>

        <g:if test="${criteriaInstance?.notes}">
            <li class="fieldcontain">
                <span id="notes-label" class="property-label"><g:message code="criteria.notes.label"
                                                                         default="Notes"/></span>

                <span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${criteriaInstance}"
                                                                                         field="notes"/></span>

            </li>
        </g:if>

        <g:if test="${criteriaInstance?.container}">
            <li class="fieldcontain">
                <span id="container-label" class="property-label"><g:message code="criteria.container.label"
                                                                             default="Container"/></span>

                <span class="property-value" aria-labelledby="container-label"><g:link controller="criteriaContainer"
                                                                                       action="show"
                                                                                       id="${criteriaInstance?.container?.id}">${criteriaInstance?.container?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${criteriaInstance?.dataType}">
            <li class="fieldcontain">
                <span id="dataType-label" class="property-label"><g:message code="criteria.dataType.label"
                                                                            default="Data Type"/></span>

                <span class="property-value" aria-labelledby="dataType-label"><g:fieldValue bean="${criteriaInstance}"
                                                                                            field="dataType"/></span>

            </li>
        </g:if>

        <g:if test="${criteriaInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="criteria.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${criteriaInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${criteriaInstance?.sequenceNumber}">
            <li class="fieldcontain">
                <span id="sequenceNumber-label" class="property-label"><g:message code="criteria.sequenceNumber.label"
                                                                                  default="Sequence Number"/></span>

                <span class="property-value" aria-labelledby="sequenceNumber-label"><g:fieldValue
                        bean="${criteriaInstance}" field="sequenceNumber"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: criteriaInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${criteriaInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
