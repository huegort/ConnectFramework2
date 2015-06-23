<%@ page import="com.guru.connectframework.activity.ActivityType" %>



<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="activityType.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.guru.connectframework.activity.ActivityCategory.list()}" optionKey="id" required="" value="${activityTypeInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'criteria', 'error')} ">
	<label for="criteria">
		<g:message code="activityType.criteria.label" default="Criteria" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityTypeInstance?.criteria?}" var="c">
    <li><g:link controller="activityCriteria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activityCriteria" action="create" params="['activityType.id': activityTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activityCriteria.label', default: 'ActivityCriteria')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'descritption', 'error')} required">
	<label for="descritption">
		<g:message code="activityType.descritption.label" default="Descritption" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descritption" required="" value="${activityTypeInstance?.descritption}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'explainationURL', 'error')} required">
	<label for="explainationURL">
		<g:message code="activityType.explainationURL.label" default="Explaination URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="explainationURL" required="" value="${activityTypeInstance?.explainationURL}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'levelRequired', 'error')} required">
	<label for="levelRequired">
		<g:message code="activityType.levelRequired.label" default="Level Required" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="levelRequired" name="levelRequired.id" from="${com.guru.connectframework.partnership.PartnershipLevel.list()}" optionKey="id" required="" value="${activityTypeInstance?.levelRequired?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activityType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityTypeInstance?.name}"/>

</div>

