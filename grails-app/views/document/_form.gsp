<%@ page import="com.guru.connectframework.util.Document" %>



<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="document.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${documentInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'document', 'error')} required">
	<label for="document">
		<g:message code="document.document.label" default="Document" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="document" required="" value="${documentInstance?.document}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'file', 'error')} required">
	<label for="file">
		<g:message code="document.file.label" default="File" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'fileType', 'error')} required">
	<label for="fileType">
		<g:message code="document.fileType.label" default="File Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileType" required="" value="${documentInstance?.fileType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="document.size.label" default="Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="size" type="number" value="${documentInstance.size}" required=""/>

</div>

