<div class="grid">
    <div class="grid__col grid__col--3-of-12">
        Endorser :
    </div>
    <div class="grid__col grid__col--3-of-12">
        ${approval.endorser.name}
    </div>
    <div class="grid__col grid__col--3-of-12">
        Approver :
    </div>
    <div class="grid__col grid__col--3-of-12">
        ${approval.approver.name}
    </div>
</div>

<div class="grid">
    <div class="grid__col grid__col--6-of-12">
       <g:if test="${approval.dateEndorsed == null}">
           Not Endorsed Yet
       </g:if>
        <g:else>
            Endorsed on ${approval.dateEndorsed}
        </g:else>
    </div>
    <div class="grid__col grid__col--6-of-12">
        <g:if test="${approval.dateApproved == null}">
            Not Approved Yet
        </g:if>
        <g:else>
            Approved on ${approval.dateApproved}
        </g:else>
    </div>
</div>
<div class="grid">
    <div class="grid__col grid__col--6-of-12">
        created on ${approval.created}
    </div>
    <div class="grid__col grid__col--6-of-12">
        created on ${approval.validTo}
    </div>
</div>

