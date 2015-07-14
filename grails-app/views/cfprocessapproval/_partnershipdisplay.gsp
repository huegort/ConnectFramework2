<div class="grid">
    <div class="grid__col grid__col--4-of-12">
        <div class="panel panel-default">
            <div class="panel-body">
            <h4>Partnership</h4>
                <dl>
                    <dt>Name:</dt>
                    <dd>${partnership.name}</dd>
                    <dt>Institution:</dt>
                    <dd>${partnership.institution.name}</dd>
                    <dt>Level Requested:</dt>
                    <dd>${partnership.partnershipLevel.name}</dd>
                    <dt>Requirements for this Level:</dt>
                    <dd>${partnership.partnershipLevel.description}</dd>
                </dl>
            </div>
        </div>
    </div>


<g:render template="approvalDisplay" model="[approval: partnership.approval]"/>




