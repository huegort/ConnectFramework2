    <div class="grid__col grid__col--4-of-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <h4>Approval Request</h4>
                <dl>
                    <dt>Created By:</dt>
                    <dd>${approval.createdBy}</dd>
                    <dt>Created on:</dt>
                    <dd><g:formatDate type="date" style="MEDIUM" date="${approval.created}"/></dd>
                    <dt>Valid to:</dt>
                    <dd><g:formatDate type="date" style="MEDIUM" date="${approval.validTo}"/></dd>
                    <dt>Current Status:</dt>
                    <dd>${approval.status.display}</dd>
                </dl>

            </div>
        </div>

    </div>
    <div class="grid__col grid__col--4-of-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <h4>Endorser : <small>${approval.endorser.name}</small></h4>

                <g:if test="${approval.dateEndorsed == null}">
                    <div class="alert alert-danger" role="alert">Not Endorsed Yet</div>
                </g:if>
                <g:else>
                    <div class="alert alert-success" role="alert">Endorsed on <g:formatDate type="date" style="MEDIUM" date="${approval.dateEndorsed}"/> </div>
                </g:else>

            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <h4>Approver : <small>${approval.approver.name}</small></h4>
                <g:if test="${approval.dateApproved == null}">
                    <div class="alert alert-danger" role="alert">Not Approved Yet</div>
                </g:if>
                <g:else>
                    <div class="alert alert-success" role="alert">Approved on <g:formatDate type="date" style="MEDIUM" date="${approval.dateApproved}"/></div>
                </g:else>
            </div>
        </div>
    </div>
</div>

