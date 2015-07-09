<%--
  Created by IntelliJ IDEA.
  User: lmanuelcb
  Date: 07/08/2015
  Time: 16:02
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
            <h1>CF_Approver Interface</h1>
        </div>
    </div>

    <div class="grid">
        <div class="grid__col grid__col--9-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Institutions Requests</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Institute Name</th>
                                <th>Request Date</th>
                                <th>User</th>
                                <th>Status</th>
                                <th>Options</th>
                            </tr>
                            <tr>
                                <td>Institution A</td>
                                <td>20/06/2015</td>
                                <td>User A</td>
                                <td>Processing</td>
                                <td>
                                    <button type="button" class="btn btn-default btn-sm" value="View"
                                            onclick="location.reload();
                                            location.href = 'CF_APPROVER_reviewInstituteRequest.html'">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Institution B</td>
                                <td>19/06/2015</td>
                                <td>User B</td>
                                <td>Processing</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Institution C</td>
                                <td>21/06/2015</td>
                                <td>User A</td>
                                <td>Processing</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Institution A</td>
                                <td>18/05/2015</td>
                                <td>User C</td>
                                <td>Rejected</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                        </table>

                        <div style="text-align: right;">
                            <a href="#">View All</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activities Requests</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Activity Name</th>
                                <th>Institute Name</th>
                                <th>Request Date</th>
                                <th>User</th>
                                <th>Status</th>
                                <th>Options</th>
                            </tr>
                            <tr>
                                <td>Activity D</td>
                                <td>Institution A</td>
                                <td>20/06/2015</td>
                                <td>User A</td>
                                <td>Processing</td>
                                <td>
                                    <button type="button" class="btn btn-default btn-sm" value="View"
                                            onclick="location.reload();
                                            location.href = 'CF_APPROVER_reviewInstituteRequest.html'">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Activity B</td>
                                <td>Institution D</td>
                                <td>19/06/2015</td>
                                <td>User B</td>
                                <td>Processing</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Activity C</td>
                                <td>Institution B</td>
                                <td>21/06/2015</td>
                                <td>User A</td>
                                <td>Processing</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Activity A</td>
                                <td>Institution E</td>
                                <td>18/05/2015</td>
                                <td>User C</td>
                                <td>Processing</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                        </table>

                        <div style="text-align: right;">
                            <a href="#">View All</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">My Faculty Activities</h3>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Activity Name</th>
                                <th>Date Created</th>
                                <th>Description</th>
                                <th>Options</th>
                            </tr>
                            <tr>
                                <td>Activity D</td>
                                <td>12/08/2014</td>
                                <td>Some Description for the activity</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Activity D</td>
                                <td>12/08/2014</td>
                                <td>Some Description for the activity</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Activity D</td>
                                <td>12/08/2014</td>
                                <td>Some Description for the activity</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Activity D</td>
                                <td>12/08/2014</td>
                                <td>Some Description for the activity</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="View">View</button>
                                </td>
                            </tr>
                        </table>

                        <div style="text-align: right;">
                            <a href="#">View All</a>
                        </div>
                    </div>
                </div>
            </div>
            <a href="CF_APPROVER_reviewInstituteRequest.html">Approve Institution Page</a>| <a
                href="CF_APPROVER_reviewActivityRequest.html">Approve Activity Page</a>| <a
                href="CF_USER_searchResults.html">Search Results</a><br>
            <a href="CF_USER_home.html">CF_USER HomePage</a> | <a href="CF_ADMIN_home.html">CF_ADMIN HomePage</a>
        </div>

        <div class="grid__col grid__col--3-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Menu</h3>
                </div>

                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation" class="active"><a href="#">Home</a></li>
                        <li role="presentation"><a href="#">Approvals</a></li>
                        <li role="presentation"><a href="#">Pending</a></li>
                        <li role="presentation"><a href="#">Faculty Activities</a></li>
                    </ul>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">My Current Activities</h3>
                </div>

                <div class="panel-body">

                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Search</h3>
                </div>

                <div class="panel-body">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" style="padding: 9px 12px;">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>