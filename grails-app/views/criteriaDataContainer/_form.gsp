<%@ page import="com.guru.connectframework.criteria.CriteriaDataContainer" %>



<div class="fieldcontain ${hasErrors(bean: criteriaDataContainerInstance, field: 'setOfCriteriaData', 'error')} ">
	<label for="setOfCriteriaData">
		<g:message code="criteriaDataContainer.setOfCriteriaData.label" default="Set Of Criteria Data" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${criteriaDataContainerInstance?.setOfCriteriaData?}" var="s">
    <li><g:link controller="criteriaData" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="criteriaData" action="create" params="['criteriaDataContainer.id': criteriaDataContainerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'criteriaData.label', default: 'CriteriaData')])}</g:link>
</li>
</ul>


</div>

