<div id="message"></div>

<div id="entityApprovalButtons" entityId="${entityId}">
    <button class="btn btn-default btn-width-20 btn-entity-approve">
        <span class="glyphicon glyphicon-ok-circle" aria-hidden="true" style="color:green; font-size: 20px;"></span>
    </button>
    <button class="btn btn-default btn-width-20 btn-entity-decline">
        <span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="color: red; font-size: 20px;"></span></button>
    <button class="btn btn-default btn-width-20 btn-entity-moreInfo">
        <span class="glyphicon glyphicon-edit" aria-hidden="true" style="font-size: 20px;"></span>
    </button>

</div>

<script>
    $(document).ready(function() {
        $(".btn-entity-approve").click(function(event){
            var newStatus = "${succesStatus}"
            callEntityChangeStatus(newStatus,event)
        });
        $(".btn-entity-decline").click(function(event){
            var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.DECLINED}"
            callEntityChangeStatus(newStatus,event)
        });
        $(".btn-entity-moreInfo").click(function(event){
            var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.INCOMPLETE}"
            callEntityChangeStatus(newStatus,event)
        });

    });
    function callEntityChangeStatus(newStatus, event) {


        var theButton = event.target
        //console.log(" clicked")


        var entityId = $( theButton ).closest("#entityApprovalButtons").attr( "entityId" );
        //console.log(criteriaDataId)

        var controllerMethod ="${controllerMethod}"
        var request;
        request = $.ajax({
            url: controllerMethod,
            method: "POST",
            data: {entityId: entityId, newCriteriaStatus: newStatus},
            dataType: "html"
        });

        request.done(function( msg ) {
            console.log("call when successful")
                $("#entityDisplay").html(msg)
         });

        request.fail(function( jqXHR, textStatus ) {
            console.log( "Request failed: " + textStatus );
        });


    }



</script>