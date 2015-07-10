<div class="grid">
    <div class="grid__col grid__col--4-of-12">
        name
    </div>
    <div class="grid__col grid__col--4-of-12">
        ${partnership.name}
    </div>
</div>
<div class="grid">
    <div class="grid__col grid__col--4-of-12">
        Level Requested
    </div>
    <div class="grid__col grid__col--4-of-12">
        ${partnership.partnershipLevel.name}
    </div>
    <div class="grid__col grid__col--4-of-12">
        <h5>Requirements for this Level</h5>
        ${partnership.partnershipLevel.description}
    </div>
</div>
<div class="grid">

    <div class="grid__col grid__col--12-of-12">
        <g:render template="approvalDisplay" model="[approval: partnership.approval]"/>
    </div>

</div>




