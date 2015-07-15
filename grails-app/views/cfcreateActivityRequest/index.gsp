<%--
  Created by IntelliJ IDEA.
  User: andrewbeatty
  Date: 08/07/15
  Time: 17:14
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Activity Request</title>
    <meta name="layout" content="bootstrap">


    <script>
        $(document).ready(function () {
            $("#submitCriteria").click(function () {
                console.log("in submit")
                var formData = {};

                formData.criteriaData = $("#criteriaDiv :input").serializeJSON();
                formData.approval = $("#approvalDiv :input").serializeJSON();
                formData.activity = $("#activityDiv :input").serializeJSON();
                // alert(criteriaData);
                console.log(formData);

                event.preventDefault();

                // TODO I should use the form itself and command objects
                var newForm = jQuery('<form>', {
                    'action': 'saveActivity',

                }).append(jQuery('<input>', {
                    'name': 'sendData',
                    'value': JSON.stringify(formData),
                    'type': 'hidden'
                })).append(jQuery('<input>', {
                    'name': 'partnershipId',
                    'value':  ${partnership.id },
                    'type': 'hidden'
                })).append(jQuery('<input>', {
                    'name': 'activityTypeId',
                    'value':  ${activityType.id },
                    'type': 'hidden'
                }));

                newForm.submit();
            });
        });

    </script>
</head>

<body>
<div class="main-body">
    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <h1>Create Activity Request</h1>

            <h3><div class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${activity.activityType}"
                                                                                        field="name"/></div></h3>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Description of Activity Type</h3>
                </div>

                <div class="panel-body">
                    <span class="property-value" aria-labelledby="level-label"><g:fieldValue
                            bean="${activity.activityType}" field="description"/></span>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Request Activity of type ??</h3>
                </div>

                <div class="panel-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="activityDiv">
                                <fieldset class="form">
                                    <g:render template="activityform" model="[activity: activity]"/>
                                </fieldset>

                            </div>

                            <div id="approvalDiv">
                                <fieldset class="form">

                                    <g:render template="/cfcommontemplates/approvalform"
                                              model="[approval: activity.approval, approvers: activity.activityType.possibleApprovers, endorsers: activity.activityType.possibleEndorsers]"/>

                                </fieldset>

                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Due diligence</h3>
                        </div>

                        <div class="panel-body">
                            <div id="criteriaDiv">
                                <fieldset class="form">

                                    <g:render template="/cfcommontemplates/criteriadataform" var="criteria"
                                              collection="${activityType.criteria}"/>

                                </fieldset>

                            </div>


                        </div>
                    </div>

                    <div style="text-align: right; margin-top: 20px;">
                        <fieldset class="buttons">
                            <g:submitButton id="submitCriteria" name="create"
                                            class="save btn btn-default"
                                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                        </fieldset>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="grid">
        <div class="grid__col grid__col--6-of-12">
        </div>
    </div>
</div>

</body>
</html>