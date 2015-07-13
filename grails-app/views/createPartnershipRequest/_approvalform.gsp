
<div class="fieldcontain  required">
    <label for="endorser">
        <g:message code="approval.endorser.label" default="Endorser" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="endorser" name="endorserId" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${approvalInstance?.endorser?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain required} ">
    <label for="approver">
        <g:message code="approval.approver.label" default="Approver" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="approver" name="approverId" from="${com.guru.connectframework.User.list()}" optionKey="id" required="" value="${approvalInstance?.approver?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain  required">
    <label for="validTo">
        Valid To
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="validTo" precision="day"  value="${approvalInstance?.validTo}"  />

</div>

