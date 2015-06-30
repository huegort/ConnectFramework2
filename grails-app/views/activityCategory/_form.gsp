<%@ page import="com.guru.connectframework.Activity.ActivityCategory" %>



<div class="fieldcontain ${hasErrors(bean: activityCategoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activityCategory.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityCategoryInstance?.name}"/>

</div>

