<%--
  Created by IntelliJ IDEA.
  User: lmanuelcb
  Date: 07/13/2015
  Time: 14:04
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <script>
        $(document).ready(function () {

        });

    </script>
</head>

<body>
<div class="main-body">
    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <h1>CF_Admin Interface</h1>
        </div>
    </div>
    <div class="grid">
        <div class="grid__col grid__col--9-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Partnership Levels</h3>
                </div>
                <div class="panel-body">
                    <div class="grid">
                        <div class="grid__col grid__col--1-of-12">
                            <button type="button" class="btn btn-default" data-toggle="modal"
                                    data-target="#myModalLevel">Add Level
                            </button>
                            <p></p>
                        </div>
                    </div>
                    <div >

                            <g:render template="partnershipLevelsDisplay"
                                     model="[ partnershileLevels: partnershipLevels]"/>


                    </div>

                    <!-- Adding Partnership Level Modal -->
                    <g:render template="createEditPartnershipLevel"
                              model="[activityTypeCategories: activityTypeCategories]"/>

                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activity Types</h3>
                </div>
                <div class="panel-body">
                    <div class="grid">
                        <div class="grid__col grid__col--3-of-12">
                            <button class="btn btn-default">Add Category</button>
                            <p></p>
                        </div>
                        <div class="grid__col grid__col--3-of-12">
                            <button class="btn btn-default">Add Activity</button>
                            <p></p>
                        </div>
                    </div>
                    <div>
                        <g:render template="activityTypeCategory"
                                  model="[activityTypeCategories: activityTypeCategories]"/>
                    </div>

                </div>
            </div>


        </div>
        <div class="grid__col grid__col--3-of-12">
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