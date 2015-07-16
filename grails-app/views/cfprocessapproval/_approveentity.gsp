<%@ page import="com.guru.connectframework.Criteria.CriteriaStatus" %>
<div id="alertMessage" class="alert alert-success alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    Changes have been <strong>Done!</strong>
    <button id="backHome" class="btn btn-default btn-success btn-xs label-success">Back Home</button>
</div>

<div id="entityApprovalButtons" entityId="${entityId}">
    <button class="btn btn-default btn-width-20 btn-entity-approve">
        <span class="glyphicon glyphicon-ok-circle" aria-hidden="true" style="color:green; font-size: 20px;"></span>
    </button>
    <button class="btn btn-default btn-width-20 btn-entity-decline">
        <span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="color: red; font-size: 20px;"></span>
    </button>
    <button class="btn btn-default btn-width-20 btn-entity-moreInfo">
        <span class="glyphicon glyphicon-edit" aria-hidden="true" style="font-size: 20px;"></span>
    </button>

</div>

<script>
    $(document).ready(function () {
        $('#alertMessage').hide()
        $('#backHome').click(function () {
            <g:if test="${succesStatus == com.guru.connectframework.Criteria.CriteriaStatus.ENDORSED}">

                window.location.href = "${createLink(uri: '/cfapprover/endorserHome')}";
            </g:if>
            <g:else>

                window.location.href = "${createLink(uri: '/cfapprover/approverHome')}";
           </g:else>

        })

        $(".btn-entity-approve").click(function (event) {
            var newStatus = "${succesStatus}"
            callEntityChangeStatus(newStatus, event)
            $('#alertMessage').show()
        });
        $(".btn-entity-decline").click(function (event) {
            var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.DECLINED}"
            callEntityChangeStatus(newStatus, event)
            $('#alertMessage').show()
        });
        $(".btn-entity-moreInfo").click(function (event) {
            var newStatus = "${com.guru.connectframework.Criteria.CriteriaStatus.INCOMPLETE}"
            callEntityChangeStatus(newStatus, event)
            $('#alertMessage').show()
        });

    });
    function callEntityChangeStatus(newStatus, event) {


        var theButton = event.target
        //console.log(" clicked")


        var entityId = $(theButton).closest("#entityApprovalButtons").attr("entityId");
        //console.log(criteriaDataId)

        var controllerMethod = "${controllerMethod}"
        var request;
        request = $.ajax({
            url: controllerMethod,
            method: "POST",
            data: {entityId: entityId, newCriteriaStatus: newStatus},
            dataType: "html"
        });

        request.done(function (msg) {
            console.log("call when successful")
            $("#entityDisplay").html(msg)
        });

        request.fail(function (jqXHR, textStatus) {
            console.log("Request failed: " + textStatus);
        });


    }



</script>