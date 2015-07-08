<%--
  Created by IntelliJ IDEA.
  User: lmanuelcb
  Date: 07/07/2015
  Time: 10:58
--%>
<%@ page import="com.guru.connectframework.activity.Activity" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap">
</head>

<body>
<div class="main-body">

    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <h1><g:message code="default.show.label" args="[entityName = 'Activity']"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
        </div>
    </div>

    <div class="grid">
        <div class="grid__col grid__col--10-of-12">
            <ol class="property-list activity">

                <g:if test="${activityInstance?.description}">
                    <dl class="dl-horizontal">
                        <dt id="description-label" class="property-label"><g:message code="activity.description.label"
                                                                                     default="Description"/></dt>

                        <dd class="property-value" aria-labelledby="description-label"><g:fieldValue
                                bean="${activityInstance}"
                                field="description"/></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.contact}">
                    <dl class="dl-horizontal">
                        <dt id="contact-label" class="property-label"><g:message code="activity.contact.label"
                                                                                 default="Contact"/></dt>

                        <dd class="property-value" aria-labelledby="contact-label"><g:link controller="contact"
                                                                                           action="show"
                                                                                           id="${activityInstance?.contact?.id}">${activityInstance?.contact?.encodeAsHTML()}</g:link></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.activityType}">
                    <dl class="dl-horizontal">
                        <dt id="activityType-label" class="property-label"><g:message code="activity.activityType.label"
                                                                                      default="Activity Type"/></dt>

                        <dd class="property-value" aria-labelledby="activityType-label"><g:link
                                controller="activityType"
                                action="show"
                                id="${activityInstance?.activityType?.id}">${activityInstance?.activityType?.encodeAsHTML()}</g:link></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.agreementTemplate}">
                    <dl class="dl-horizontal">
                        <dt id="agreementTemplate-label" class="property-label"><g:message
                                code="activity.agreementTemplate.label" default="Agreement Template"/></dt>

                        <dd class="property-value" aria-labelledby="agreementTemplate-label"><g:link
                                controller="document"
                                action="show"
                                id="${activityInstance?.agreementTemplate?.id}">${activityInstance?.agreementTemplate?.encodeAsHTML()}</g:link></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.approval}">
                    <dl class="dl-horizontal">
                        <dt id="approval-label" class="property-label"><g:message code="activity.approval.label"
                                                                                  default="Approval"/></dt>

                        <dd class="property-value" aria-labelledby="approval-label"><g:link controller="approval"
                                                                                            action="show"
                                                                                            id="${activityInstance?.approval?.id}">${activityInstance?.approval?.encodeAsHTML()}</g:link></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.dataContainer}">
                    <dl class="dl-horizontal">
                        <dt id="dataContainer-label" class="property-label"><g:message
                                code="activity.dataContainer.label"
                                default="Data Container"/></dt>

                        <dd class="property-value" aria-labelledby="dataContainer-label"><g:link
                                controller="criteriaDataContainer" action="show"
                                id="${activityInstance?.dataContainer?.id}">${activityInstance?.dataContainer?.encodeAsHTML()}</g:link></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.finalAgreement}">
                    <dl class="dl-horizontal">
                        <dt id="finalAgreement-label" class="property-label"><g:message
                                code="activity.finalAgreement.label"
                                default="Final Agreement"/></dt>

                        <dd class="property-value" aria-labelledby="finalAgreement-label"><g:link controller="document"
                                                                                                  action="show"
                                                                                                  id="${activityInstance?.finalAgreement?.id}">${activityInstance?.finalAgreement?.encodeAsHTML()}</g:link></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.name}">
                    <dl class="dl-horizontal">
                        <dt id="name-label" class="property-label"><g:message code="activity.name.label"
                                                                              default="Name"/></dt>

                        <dd class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${activityInstance}"
                                                                                              field="name"/></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.owner}">
                    <dl class="dl-horizontal">
                        <dt id="owner-label" class="property-label"><g:message code="activity.owner.label"
                                                                               default="Owner"/></dt>

                        <dd class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show"
                                                                                         id="${activityInstance?.owner?.id}">${activityInstance?.owner?.encodeAsHTML()}</g:link></dd>

                    </dl>
                </g:if>

                <g:if test="${activityInstance?.partnership}">
                    <dl class="dl-horizontal">
                        <dt id="partnership-label" class="property-label"><g:message code="activity.partnership.label"
                                                                                     default="Partnership"/></dt>

                        <dd class="property-value" aria-labelledby="partnership-label"><g:link controller="partnership"
                                                                                               action="show"
                                                                                               id="${activityInstance?.partnership?.id}">${activityInstance?.partnership?.encodeAsHTML()}</g:link></dd>

                    </dl>
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