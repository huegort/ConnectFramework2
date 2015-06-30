<%@ page import="com.guru.connectframework.criteria.CriteriaContainer" %>



<div class="fieldcontain ${hasErrors(bean: criteriaContainerInstance, field: 'setOfCriteria', 'error')} ">
	<label for="setOfCriteria">
		<g:message code="criteriaContainer.setOfCriteria.label" default="Set Of Criteria" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${criteriaContainerInstance?.setOfCriteria?}" var="s">
    <li><g:link controller="criteria" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="criteria" action="create" params="['criteriaContainer.id': criteriaContainerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'criteria.label', default: 'Criteria')])}</g:link>
</li>
</ul>


</div>

