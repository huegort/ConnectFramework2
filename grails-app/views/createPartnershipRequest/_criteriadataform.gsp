

<g:each in="${partnershipLevel.criteria}" var="criteria">

    <div>
        <label for=${criteria.id}>
            ${criteria.name}
        </label>

        <g:if test="${criteria.dataType == com.guru.connectframework.criteriatype.CriteriaType.STRING}">
            <g:textField name="data_${criteria.id}" />
        </g:if>
        <g:elseif test="${criteria.dataType == com.guru.connectframework.criteriatype.CriteriaType.FILE}">
            <input type="file" name="data_${criteria.id}" />
        </g:elseif>
        <g:elseif test="${criteria.dataType == com.guru.connectframework.criteriatype.CriteriaType.DATE}">
           <g:datePicker name="data_${criteria.id}"  precision="day"/>
        </g:elseif>



    </div>


</g:each>