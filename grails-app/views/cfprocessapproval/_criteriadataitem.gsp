<tr>
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
        <button class="btn btn-default btn-width-30"><span class="glyphicon glyphicon-ok-circle"
                                                           aria-hidden="true"
                                                           style="color:green; font-size: 20px;"></span>
        </button>
        <button class="btn btn-default btn-width-30"><span
                class="glyphicon glyphicon-remove-circle" aria-hidden="true"
                style="color: red; font-size: 20px;"></span></button>
        <button class="btn btn-default btn-width-30"><span class="glyphicon glyphicon-edit"
                                                           aria-hidden="true"
                                                           style="font-size: 20px;"></span>
        </button>
    </td>
    <td>
        ${criteriaData.criteria.description}
    </td>

</tr>