<%--
  Created by IntelliJ IDEA.
  User: andrewbeatty
  Date: 10/07/15
  Time: 06:49
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Approve Partnership Request</title>
    <meta name="layout" content="bootstrap">


    <script>
        $(document).ready(function() {

        });
    </script>
</head>

<body>
<div class="main-body">
    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Partnership Information</h3>
                </div>
                <div class="panel-body">
                    <g:render template="partnershipDisplay" model="[partnership: partnership]"/></div>
            </div>
        </div>
        <div class="grid__col grid__col--12-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Due Diligence</h3>
                </div>
                <div class="panel-body">
                    <g:render template="criteriadatadisplay"   model="[setOfCriteriaData: partnership.criteriaData, succesStatus: succesStatus]"/>
                </div>
            </div>
        </div>
        <div class="grid__col grid__col--12-of-12">
            <H3>Overall Aprroval</H3>
            <div>
                <button class="btn btn-default btn-width-30">
                    <span class="glyphicon glyphicon-ok-circle" aria-hidden="true" style="color:green; font-size: 20px;"></span>
                </button>
                <button class="btn btn-default btn-width-30">
                    <span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="color: red; font-size: 20px;"></span></button>
                <button class="btn btn-default btn-width-30">
                    <span class="glyphicon glyphicon-edit" aria-hidden="true" style="font-size: 20px;"></span>
                </button>

            </div>
        </div>
    </div>

</div>


</body>
</html>