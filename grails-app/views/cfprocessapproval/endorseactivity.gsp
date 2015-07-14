<%--
  Created by IntelliJ IDEA.
  User: andrewbeatty
  Date: 10/07/15
  Time: 06:49
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ebdorse Activity Request</title>
    <meta name="layout" content="bootstrap">


    <script>
        function whenSuccesful(newEntityHtml){
            $("#entityDisplay").html(newEntityHtml)
     }
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
                    <h3 class="panel-title">Activity Information</h3>
                </div>
                <div id="entityDisplay" class="panel-body">
                    <g:render template="activityDisplay" model="[activity: activity]"/></div>
            </div>
        </div>
        <div class="grid__col grid__col--12-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Due Diligence</h3>
                </div>
                <div class="panel-body">
                    <g:render template="criteriadatadisplay"   model="[setOfCriteriaData: activity.criteriaData, succesStatus: succesStatus]"/>
                </div>
            </div>
        </div>
        <div class="grid__col grid__col--12-of-12">
            <H3>Overall Aprroval</H3>
            <em>What do we want to happen here? change back from endorsed/ go straight back to approver page</em>
            <g:render template="approveentity"   model="[ succesStatus: succesStatus, entityId: activity.id, controllerMethod: 'changeActivityStatus' ]"/>
        </div>
    </div>

</div>


</body>
</html>