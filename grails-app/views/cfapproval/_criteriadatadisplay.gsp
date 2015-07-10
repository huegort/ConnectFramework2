<table>
    <thead>
        <th> name</th>
        <th> data</th>
        <th> status</th>
        <th> action</th>
        <th> description of criteria</th>
    </thead>

    <g:render template="criteriadataitem"  var="criteriaData" collection="${partnership.criteriaData}"/>


</table>