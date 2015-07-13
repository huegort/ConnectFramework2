<td>
    ${criteriaData.criteria.name}
</td>
<td>
    <g:render template="${criteriaData.criteria.dataType.displayRenderer}" model="[criteriaData: criteriaData]"/>

</td>
    <td>
        ${criteriaData.approval.status}
    </td>
    <td>
        <span class="criteriaDataEdit" criteriaId="${criteriaData.id}">
                <button class="btn btn-default btn-sm  btn-criteria-approve">
                    <span class="glyphicon glyphicon-ok-circle" aria-hidden="true" style="color:green;"></span>
                </button>
                <button class="btn btn-default btn-sm btn-criteria-decline">
                    <span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="color: red; "></span>
                </button>
                <button class="btn btn-default btn-sm btn-criteria-moreInfo">
                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                </button>
            </span>
    </td>
    <td>
        ${criteriaData.criteria.description}
    </td>

    
       

