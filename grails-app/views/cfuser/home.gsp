<%--
  Created by IntelliJ IDEA.
  User: lmanuelcb
  Date: 06/30/2015
  Time: 10:51
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap">

    <script type="text/javascript">

        $(document).ready(function () {
            //init settings
            $('#activityRequestPanel').hide()
            $('#partnershipRequestPanel').hide()
            $('#currentActivitiesPanel').hide()

            /*  Searches institutions when user types into textfield '#institutes' */
            $.ajax({
                type: 'POST',
                url: 'institutionsList',
                dataType: 'json',
                data: {
                    q: $('#institutes').val()
                },
                success: function (data) {
                    var a = []
                    for (i = 0; i < data.length; i++) {
                        a.push(data[i].name)
                    }
                    $('#institutes').autocomplete({
                        source: a
                    })
                }
            })

            /* Sets the values to the select tag '#categories'*/
            $.ajax({
                type: 'POST',
                url: 'getCategories',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (i, item) {
                        $('#Categories').append($('<option>', {
                            value: item.id,
                            text: item.name
                        }))
                    })
                }
            })

            /* Gets User Activities*/
            $.ajax({
                type: 'POST',
                url: 'getActivities',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (i, item) {
                        var c = ''
                        $.each(item, function (a, b) {
                            c = c + '<p><a href=\"${createLink(uri: '/cfuser/showActivity/')}' + b.id + '\">' + b.name + '</a></p>'
                        })
                        $('#myActivitiesArticle').append('<details><summary class="h4">' + i + '</summary>' + c + '</details>')
                        $('#currentActivitiesPanel').show()
                    })
                }
            })

            /* Get Activities Request */
            $.ajax({
                type: 'POST',
                url: 'getActivitiesRequest',
                dataType: 'json',
                success: function (data) {
                    if (data.length > 0) {
                        $.each(data, function (i, item) {
                            $('#activityRequestTable').append('<tr><td>'+ item.id +'</td><td>' + item.partnership.institution.name + '</td><td>' +  item.name + '</td><td>' + item.approval.dateCreated.split("T")[0] + '</td><td>' + item.approval.status.name + '</td></tr>')
                        })
                        $("#activityRequestTable").bootgrid({
                            formatters: {
                                "linka": function(column, row)
                                {
                                    return '<a href=\"${createLink(uri: '/cfuser/showActivity/')}'+ row.id +'\">' + row.activityName + '</a>'
                                },
                                "linkb": function(column, row)
                                {
                                    return '<a href=\"${createLink(uri: '/cfuser/showPartnership/')}'+ row.id +'\">' + row.institution + '</a>'
                                }

                            }
                        });
                        $('#activityRequestPanel').show()
                    }
                }
            })

            /* Get Institute Request*/
            $.ajax({
                type: 'POST',
                url: 'getPartnershipRequest',
                dataType: 'json',
                success: function (data) {
                    if (data.length > 0) {
                        $.each(data, function (i, item) {
                            $('#partnershipRequestTable tbody').append('<tr><td>'+ item.id +'</td><td>' +  item.institution.name + '</td><td>' + item.approval.dateCreated.split("T")[0] + '</td><td>' + item.partnershipLevel.name + '</td><td>' + item.approval.status.name + '</td></tr>')
                        })
                        $("#partnershipRequestTable").bootgrid({
                            formatters: {
                                "link": function(column, row)
                                {
                                    return '<a href=\"${createLink(uri: '/cfuser/showPartnership/')}'+ row.id +'\">' + row.institution + '</a>'
                                }
                            }
                        });
                        $('#partnershipRequestPanel').show()
                    }
                }
            })

        });
        /* Adds description when user chooses an activty */
        function getDescriptionContent() {
            $.ajax({
                type: 'POST',
                url: 'getActivityTypes',
                dataType: 'json',
                success: function (data) {
                    $('#description').append($('<p>', {
                        value: data[$('#activities').val() - 1].id,
                        text: data[$('#activities').val() - 1].description
                    }))
                }
            })
        }

        /* Clears description when user clicks on a different activity*/
        function clearDescription() {
            $('#description').empty();
            //jQuery('#description p').html('');
        }

        /*Gets activities for activity category*/
        function getActivitiesForCategory() {
            /* Gets the category types*/
            removeOptions('#activities')
            clearDescription()
            $('#removeCategory').prop('disabled', true)
            $.ajax({
                type: 'POST',
                url: 'getActivityTypes',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (i, item) {
                        if ($("#category option:selected").text() == item.category.name) {
                            $('#activities').append($('<option>', {
                                value: item.id,
                                text: item.name
                            }))
                        }
                    })
                }
            })
        }


        function clearInput(value) {
            $(value).val(' ');
        }

        function removeOptions(value) {
            $(value).find('option').remove()
        }



    </script>

</head>

<body>
<div class="main-body">
    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <h1>CF_User Interface</h1>
        </div>
    </div>

    <div class="grid">
        <div class="grid__col grid__col--6-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Create Activity</h3>
                </div>

                <div class="panel-body">
                    <g:form action="createActivityRequest">

                        <div id="institute">
                            <h4>Please Select Institute</h4>
                            <input id="institutes" type="text" class="form-control" value="" name="institutionId">
                            <div class="fieldcontain ">
                                <label for="createNewInstitution">
                                    Create New Institution
                                    <span class="required-indicator">*</span>
                                </label>
                                <g:checkBox id="createNewInstitution" name="createNewInstitution" />

                            </div>

                        </div>

                        <div id="category">
                            <h4>Please Select Category</h4>
                            <select id="Categories" class="form-control" onchange="getActivitiesForCategory()" name="category"
                                    onclick="">
                            <option id="removeCategory">Please Select Category</option>
                            </select>
                        </div>

                        <p></p>

                        <div id="categoryDescriptionField" class="panel panel-default">
                            <div class="panel-body">
                                <div id="activity">
                                    <h4>Please Select Activity Type</h4>
                                    <select id="activities" multiple class="form-control" name="activityTypeId" onclick="clearDescription()"
                                            onchange="
                                                getDescriptionContent();">

                                    </select>
                                </div>

                                <p></p>

                                <div id="activityDescriptionField" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Description Field</h3>
                                    </div>

                                    <div class="panel-body" id="description">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="text-align: right;">
                            <input class="btn btn-default" id="createbutton" type="submit" value="Create"

                                   style="margin-top: 15px;">
                        </div>
                    </g:form>
                </div>
            </div>

            <div id="CurrentActivitiesPanel" class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">My Current Activitites</h3>
                </div>

                <div class="panel-body">
                    <section>
                        <article id="myActivitiesArticle">

                        </article>
                    </section>
                </div>
            </div>

            <%-- Search Field CF_User Home --%>
            <%--<div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Search</h3>
                </div>
                    <div style="text-align: center;">
                        <form style="margin-bottom: 0px;">
                            <div class="grid">
                                <div class="grid__col grid__col--6-of-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search for...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" style="padding: 9px 12px;">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>

                                <div class="grid__col grid__col--6-of-12">
                                    <div class="checkbox">
                                        <p>
                                            <input type="checkbox">Activities
                                        </p>

                                        <p>
                                            <input type="checkbox" value="Institute">Institutes
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>--%>

        </div>

        <div class="grid__col grid__col--6-of-12">
            <div id="partnershipRequestPanel" class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Institute Request Status</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="partnershipRequestTable" class="table table-condensed table-hover table-striped">
                            <thead>
                            <tr>
                                <th data-column-id="id" data-visible="false" datatype="numeric">ID</th>
                                <th data-column-id="institution" data-formatter="link">Institute Name</th>
                                <th data-column-id="dateCreated">Date Created</th>
                                <th data-column-id="level">Level</th>
                                <th data-column-id="statusName">Status</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div id="activityRequestPanel" class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activity Request Status</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="activityRequestTable" class="table">
                            <thead>
                            <tr>
                                <th data-column-id="id" data-visible="false" datatype="numeric">ID</th>
                                <th data-column-id="institution" data-formatter="linkb">Institute Name</th>
                                <th data-column-id="activityName" data-formatter="linka">Activity Name</th>
                                <th data-column-id="dateCreated">Date Created</th>
                                <th data-column-id="statusName">Status</th>
                            </tr>
                            </thead>
                            <tbody>

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