<div class="grid__col grid__col--4-of-12">
    <div class="panel panel-default">
        <div class="panel-body">
            <h4>Endorser : <small>${approval.endorser.name}</small></h4>
            <p>created on ${approval.created}</p>
            <g:if test="${approval.dateEndorsed == null}">
                <div class="alert alert-danger" role="alert">Not Endorsed Yet</div>
            </g:if>
            <g:else>
                <div class="alert alert-success" role="alert">Endorsed on ${approval.dateEndorsed}</div>
            </g:else>

        </div>
    </div>
</div>
<div class="grid__col grid__col--4-of-12">
    <div class="panel panel-default">
        <div class="panel-body">
            <h4>Approver : <small>${approval.approver.name}</small></h4>
            <p>created on ${approval.validTo}</p>
            <g:if test="${approval.dateApproved == null}">
                <div class="alert alert-danger" role="alert">Not Approved Yet</div>
            </g:if>
            <g:else>
                <div class="alert alert-success" role="alert">Approved on ${approval.dateApproved}</div>
            </g:else>
        </div>
    </div>
</div>
</div>

