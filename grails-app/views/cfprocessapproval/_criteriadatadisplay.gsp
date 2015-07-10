<div class="table-responsive">
    <table class="table">
        <thead>
        <th>Name</th>
        <th>Data</th>
        <th>Status</th>
        <th>Action</th>
        <th>Description Of Criteria</th>
        </thead>

        <g:render template="criteriadataitem" var="criteriaData" collection="${partnership.criteriaData}"/>

    </table>
</div>