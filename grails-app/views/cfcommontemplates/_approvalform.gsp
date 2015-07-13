<div class="fieldcontain  required">
    <label for="endorser">
        <g:message code="approval.endorser.label" default="Endorser"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="endorser" name="endorserId" from="${endorsers}" optionKey="id" required=""
              value="${approvalInstance?.endorser?.id}" class="many-to-one form-control"/>

</div>

<div class="fieldcontain required} ">
    <label for="approver">
        <g:message code="approval.approver.label" default="Approver"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="approver" name="approverId" from="${approvers}" optionKey="id" required=""
              value="${approvalInstance?.approver?.id}" class="many-to-one form-control"/>

</div>

<div class="fieldcontain  required">
    <label for="validTo">
        Valid To
        <span class="required-indicator">*</span>
    </label>
    <div>
        <g:datePicker class="form-control" type="date" name="validTo" precision="day"  value="${approvalInstance?.validTo}"  />
    </div>
</div>

