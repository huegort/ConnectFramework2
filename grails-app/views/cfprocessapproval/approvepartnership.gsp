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
                <div class="panel-body" id ="entityDisplay">
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
            <g:render template="approveentity"   model="[ succesStatus: succesStatus, entityId: partnership.id, controllerMethod: 'changePartnershipStatus' ]"/>
        </div>
    </div>

</div>


</body>
</html>