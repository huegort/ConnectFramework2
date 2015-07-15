<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    <g:each var="category" in="${activityTypeCategories}">

      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading_${category.id}">
          <h4 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_${category.id}" aria-expanded="false" aria-controls="collapse_${category.id}">
                ${category.name}
            </a>
          </h4>
        </div>
        <div id="collapse_${category.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_${category.id}">
          <div class="panel-body">
              <g:render template="activitytype/activityTypeDisplay"
                        model="[activityTypes: category.activityTypes, category : category]"/>
            </div>
        </div>
      </div>
    </g:each>
</div>
