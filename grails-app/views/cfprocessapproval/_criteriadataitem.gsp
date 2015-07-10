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
        <button class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-ok-circle" aria-hidden="true" style="color:green;"></span>
        </button>
        <button class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="color: red; "></span></button>
        <button class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        </button>
    </td>
    <td>
        ${criteriaData.criteria.description}
    </td>

    
       

