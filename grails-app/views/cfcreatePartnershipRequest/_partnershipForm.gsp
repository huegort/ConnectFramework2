<div class="fieldcontain ${hasErrors(bean: partnership, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="partnership.name.label" default="Name of Partnership" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="form-control" name="name" required="" value="${partnership?.name}"/>

</div>