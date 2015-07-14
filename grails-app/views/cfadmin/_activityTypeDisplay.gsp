<div class="table-responsive">
    <table class="table">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Pequired Partnership</th>
            <th>Duration</th>
            <th>Url to documentation</th>
            <th>Document</th>
        </tr>
        <g:render template="activityTypeRow"
                  var="activityType"
                  collection="${activityTypes}"/>
    </table>
</div>
