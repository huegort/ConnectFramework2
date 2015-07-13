    <div class="grid">
        <div class="grid__col grid__col--4-of-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <dl>
                        <dt>Name:</dt>
                        <dd>${activity.name}</dd>
                        <dt>Activity Type:</dt>
                        <dd>${activity.activityType}</dd>
                        <dt>Level Required for this activity:</dt>
                        <dd>${activity.activityType.requiredLevel.name}</dd>
                        <dt>Requirements for this Level:</dt>
                        <dd>${activity.activityType.description}</dd>
                    </dl>
                </div>
        </div>
    </div>


<g:render template="approvalDisplay" model="[approval: activity.approval]"/>
