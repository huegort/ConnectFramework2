<%@ page import="com.guru.connectframework.Criteria.CriteriaStatus" %>
<td>
    ${criteriaData.criteria.name}
</td>
<td>
    <g:render template="${criteriaData.criteria.dataType.displayRenderer}" model="[criteriaData: criteriaData]"/>

</td>
    <td>
        ${criteriaData.approval.status}<br>
        <g:if test="${criteriaData.approval.status == com.guru.connectframework.Criteria.CriteriaStatus.APPROVED}">
            <small>by ${criteriaData.approval.approver} on <g:formatDate type="date" style="MEDIUM" date="${criteriaData.approval.dateApproved}"/></small>
        </g:if>
        <g:if test="${criteriaData.approval.status == com.guru.connectframework.Criteria.CriteriaStatus.ENDORSED}">
            <small>by ${criteriaData.approval.endorser} on <g:formatDate type="date" style="MEDIUM" date="${criteriaData.approval.dateEndorsed}"/></small>
        </g:if>
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

    
       

