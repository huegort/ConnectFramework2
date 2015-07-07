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

            /* Gets the category types*/
            $.ajax({
                type: 'POST',
                url: 'getActivityTypes',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (i, item) {
                        $('#activities').append($('<option>', {
                            value: item.id,
                            text: item.name
                        }))
                    })
                }
            })

            /* Gets User Activities*/
            $.ajax({
                type: 'POST',
                url: 'getUserActivities',
                dataType: 'json',
                data: {
                    q: '1'
                },
                success: function (data) {
                    $.each(data, function (i, item) {
                        var c = ''
                        $.each(item, function (a,b){
                            c = c + '<p id=\'' + a + '\'>' + b.name + '</p>'
                        })
                        $('#myActivitiesArticle').append('<details><summary class="h4">'+i+'</summary>' + c + '</details>')
                    })
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
                        value: data[$('#activities').val()-1].id,
                        text: data[$('#activities').val()-1].description
                    }))
                }
            })
        }

        /* Clears description when user clicks on a different activity*/
        function clearDescription() {
            $('#description').empty();
            //jQuery('#description p').html('');
        }



        function clearInput(value) {
            $(value).val(' ');
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
                    <g:form>

                        <div id="institute">
                            <h4>Please Select Institute</h4>
                            <input id="institutes" type="text" class="form-control" value="">
                        </div>

                        <div id="category">
                            <h4>Please Select Category</h4>
                            <select id="Categories" class="form-control">

                            </select>
                        </div>

                        <p></p>

                        <div id="categoryDescriptionField" class="panel panel-default">
                            <div class="panel-body">
                                <div id="activity">
                                    <h4>Please Select Activity</h4>
                                    <select id="activities" multiple class="form-control" onclick="clearDescription()" onchange="
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
                            <input class="btn btn-default" id="createbutton" type="button" value="Create"
                                   onclick="location.href = 'CF_USER_createInstituteRequest.html'"
                                   style="margin-top: 15px;">
                        </div>
                    </g:form>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Search</h3>
                </div>

                <div class="panel-body">
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
            </div>

            <button class="btn btn-default btn-sm" value="See my Documents">See my Documents</button>
            <br>
            <a href="CF_USER_createInstituteRequest.html">Institute Request Page</a>| <a
                href="CF_USER_createActivityRequest.html">Activity Request Page</a>| <a
                href="CF_USER_searchResults.html">Search Results</a><br>
            <a href="CF_APPROVER_home.html">CF_APPROVER HomePage</a>| <a href="CF_ADMIN_home.html">CF_ADMIN HomePage</a>
        </div>

        <div class="grid__col grid__col--6-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Institute Request Status</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Institute Name</th>
                                <th>Date Created</th>
                                <th>Status</th>
                                <th>Options</th>
                            </tr>
                            <tr>
                                <td>Institute D</td>
                                <td>12/08/2014</td>
                                <td>Processing</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="Edit">Edit</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activity Request Status</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Activity Name</th>
                                <th>Date Created</th>
                                <th>Status</th>
                                <th>Options</th>
                            </tr>
                            <tr>
                                <td>Activity D</td>
                                <td>12/08/2014</td>
                                <td>Processing</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="Edit">Edit</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
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
        </div>
    </div>
</div>
</body>
</html>