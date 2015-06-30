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
                    <form>
                        <div id="category">
                            <h4>Please Select Category</h4>
                            <select id="Categories" class="form-control" onchange="showActivitiesField()">
                                <option>Category One</option>
                                <option>Category Two</option>
                                <option>Category Three</option>
                            </select>
                        </div>
                        <div id="activity" style="display: none;">
                            <h4>Please Select Activity</h4>
                            <select id="Activities" class="form-control"
                                    onchange="getActivityValues();getDescriptionContent();showDescription();">
                                <option>Request Activity</option>
                                <option>Activity One</option>
                                <option>Activity Two</option>
                                <option>Activity Three</option>
                            </select>
                        </div>

                        <p></p>

                        <div id="descriptionField" class="panel panel-default hidden">
                            <div class="panel-heading">
                                <h3 class="panel-title">Description Field</h3>
                            </div>
                            <div class="panel-body" id="description">

                            </div>
                        </div>

                        <div id="institute" class="hidden">
                            <h4>Please Select Institute</h4>
                            <select id="Institutes" class="form-control" onchange="">
                                <option>Request Institute</option>
                                <option>Institute One</option>
                                <option>Institute Two</option>
                                <option>Institute Three</option>
                            </select>
                        </div>
                        <div style="text-align: right;">
                            <input class="btn btn-default" id="createbutton" type="button" value="Create" onclick=""
                                   style="margin-top: 15px;">
                        </div>
                    </form>
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
            <a href="CF_USER_createInstituteRequest.html"> Institute Request Page </a>| <a
                href="CF_USER_createActivityRequest.html"> Activity Request Page </a>| <a
                href="CF_USER_searchResults.html"> Search Results</a><br>
            <a href="CF_APPROVER_home.html"> CF_APPROVER HomePage </a>| <a href="CF_ADMIN_home.html"> CF_ADMIN HomePage</a>
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
                        <article>
                            <details>
                                <summary class="h4">Institute One</summary>
                                <details>
                                    <summary class="h5">Activities</summary>
                                    <p>1. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>

                                    <p>2. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>

                                    <p>3. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>
                                </details>
                            </details>

                            <details>
                                <summary class="h4">Institute Two</summary>
                                <details>
                                    <summary class="h5">Activities</summary>
                                    <p>1. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>

                                    <p>2. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>

                                    <p>3. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>
                                </details>
                            </details>

                            <details>
                                <summary class="h4">Institute Three</summary>
                                <details>
                                    <summary class="h5">Activities</summary>
                                    <p>1. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>

                                    <p>2. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>

                                    <p>3. Activity
                                        <button class="btn btn-default"><span class="glyphicon glyphicon-edit"
                                                                              aria-hidden="true"></span></button>
                                    </p>
                                </details>
                            </details>
                        </article>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>