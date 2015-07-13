    <div class="grid">
        <div class="grid__col grid__col--4-of-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h4>Activity</h4>
                    <dl>
                        <dt>Name:</dt>
                        <dd>${activity.name}</dd>
                        <dt>Activity Type:</dt>
                        <dd>${activity.activityType}</dd>
                        <dt>Institution:</dt>
                        <dd>${activity.partnership.institution.name}</dd>
                        <dt>Level Required for this activity:</dt>
                        <dd>${activity.activityType.requiredLevel.name}</dd>
                        <dt>Description of this Activity:</dt>
                        <dd>${activity.activityType.description}</dd>
                    </dl>
                </div>
            </div>
        </div>


<g:render template="approvalDisplay" model="[approval: activity.approval]"/>
