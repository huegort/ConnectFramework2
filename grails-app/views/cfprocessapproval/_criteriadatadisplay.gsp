<div class="table-responsive">
    <table class="table">
        <thead>
        <th>Name</th>
        <th>Data</th>
        <th>Status</th>
        <th>Action</th>
        <th>Description Of Criteria</th>
        </thead>

    <g:render template="criteriadataitem"  var="criteriaData" collection="${setOfCriteriaData}"/>

    </table>
</div>
<script>
    $(document).ready(function (){
        $(".btn-criteria-approve").click(function(event){
            var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.APPROVED}"
            callChangeStatus(newStatus,event)
        });
        $(".btn-criteria-decline").click(function(event){
            var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.DECLINED}"
            callChangeStatus(newStatus,event)
        });
        $(".btn-criteria-moreInfo").click(function(event){
            var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.INCOMPLETE}"
            callChangeStatus(newStatus,event)
        });

    });
    function callChangeStatus(newStatus, event) {

        var theButton = event.target
        console.log(" clicked")

        var criteriaDataId = $( theButton ).closest(".criteriaDataEdit").attr( "criteriaId" );
        console.log(criteriaDataId)
        var theTargetRow = $( theButton ).closest("tr")
        var targetRowId = theTargetRow.attr("id")
        console.log("target Row Id"+ targetRowId)

        var request = $.ajax({
            url: "changeApprovalStatus",
            method: "POST",
            data: { criteriaDataId : criteriaDataId, newCriteriaStatus : newStatus },
            dataType: "html"
        });

        request.done(function( msg ) {

            console.log("back from server:");
            console.log(targetRowId)
            console.log( $("body").find('#' + targetRowId).html())
            $("body").find('#' + targetRowId).html(msg)
            // re bind the clicks

            var row = $("body").find('#' + targetRowId);

            row.find(".btn-criteria-approve").click(function(event){
                var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.APPROVED}"
                callChangeStatus(newStatus,event)
            });
            row.find(".btn-criteria-decline").click(function(event){
                var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.DECLINED}"
                callChangeStatus(newStatus,event)
            });
            row.find(".btn-criteria-moreInfo").click(function(event){
                var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.INCOMPLETE}"
                callChangeStatus(newStatus,event)
            });
        });

        request.fail(function( jqXHR, textStatus ) {
            console.log( "Request failed: " + textStatus );
        });


    }
</script>