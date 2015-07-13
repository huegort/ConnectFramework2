<%--
  Created by IntelliJ IDEA.
  User: lmanuelcb
  Date: 07/07/2015
  Time: 10:33
--%>
<%@ page import="com.guru.connectframework.partnership.Partnership" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <script type="text/javascript">

        $(document).ready(function () {
            //Init Values
            $('#institutionEndorseTable').hide()
            $('#institutionEndorseTable').bootgrid({
                formatters: {
                    "commands": function(column, row)
                    {
                        return "<button type=\"button\" class=\"btn btn-default btn-xs\" value=\"View\" onclick=\"location.reload();location.href = \'${createLink(uri: '/cfProcessApproval/endorsePartnership?partnershipId=')}" + row.id + "\'\"><span class=\"glyphicon glyphicon-pencil\"></span></button>"
                    }
                }
            })
            $('#institutionEndorseTable').show()

            $('#activityEndorseTable').hide()
            $('#activityEndorseTable').bootgrid({
                formatters: {
                    "commands": function(column, row)
                    {
                        return "<button type=\"button\" class=\"btn btn-default btn-xs\" value=\"View\" onclick=\"location.reload();location.href = \'${createLink(uri: '/cfProcessApproval/endorseActivity?activityId=')}" + row.id + "\'\"><span class=\"glyphicon glyphicon-pencil\"></span></button>"
                    }
                }
            })
            $('#activityEndorseTable').show()



        })
    </script>
</head>

<body>
<div class="main-body">
    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <h1>CF_Approver Interface</h1>
        </div>
    </div>

    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Institutions</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="institutionEndorseTable" class="table table-condensed table-hover table-striped">
                            <thead>
                            <tr>
                                <th data-column-id="id" data-visible="false"><g:message code="partnership.approval.id.label" default="ID"/></th>

                                <th data-column-id="status"><g:message code="partnership.approval.status.label" default="Status"/></th>

                                <th data-column-id="institution"><g:message code="partnership.institution.label" default="Institution"/></th>

                                <th data-column-id="partnershipName"><g:message code="partnership.name.label" default="Partnership Name"/></th>

                                <th data-column-id="owner"><g:message code="partnership.owner.label" default="Owner"/></th>

                                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Options</th>

                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${resultsPartnership}" var="result">
                                <tr>
                                    <td>${result.id}</td>

                                    <td>${result.approval.status.name}</td>

                                    <td>${result.institution}</td>

                                    <td>${result.name}</td>

                                    <td>${result.owner}</td>

                                    <td></td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activities</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="activityEndorseTable" class="table table-condensed table-hover table-striped">
                            <thead>
                            <tr>
                                <th data-column-id="id" data-visible="false"><g:message code="partnership.approval.id.label" default="ID"/></th>

                                <th data-column-id="status"><g:message code="partnership.approval.status.label" default="Status"/></th>

                                <th data-column-id="institution"><g:message code="partnership.institution.label" default="Institution"/></th>

                                <th data-column-id="activityName"><g:message code="partnership.name.label" default="Activity Name"/></th>

                                <th data-column-id="owner"><g:message code="partnership.owner.label" default="Owner"/></th>

                                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Option</th>

                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${resultsActivity}" var="result">
                                <tr>
                                    <td>${result.id}</td>

                                    <td>${result.approval.status.name}</td>

                                    <td>${result.partnership.institution}</td>

                                    <td>${result.name}</td>

                                    <td>${result.owner}</td>

                                    <td><button type="button"
                                                class="btn btn-default btn-sm"
                                                value="View"
                                                onclick="location.reload();location.href = '${createLink(uri: '/cfapprover/showPartnership/')}${result.id}'">View</button></td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>