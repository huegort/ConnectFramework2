<div class="table-responsive">
    <table class="table">
       <tr>
           <th>Name</th>
           <th>Description</th>
           <th>Duration</th>
           <th>Url to documentation</th>
           <th>Level</th>
       </tr>
        <g:render template="partnershiplevel/partnershipLevelRow"
                  var="partnershipLevel"
                  collection="${partnershipLevels}"/>
    </table>
</div>



