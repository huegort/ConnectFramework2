<div id="createEditContactPanel" class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Create/Edit Contact</h3>
    </div>
    <div class="panel-body">
        <label>Title</label>
        <select id="contactTitleForm" class="form-control">
            <option>Ms</option>
            <option>Miss</option>
            <option>Mrs</option>
            <option>Mr</option>
        </select>
        <label>First Name</label>
        <input id="contactFirstForm" type="text" class="form-control"/>
        <label>Last Name</label>
        <input id="contactLastForm" type="text" class="form-control"/>
        <label>Role in Institution</label>
        <input id="contactRoleForm" type="text" class="form-control"/>
        <label>Phone</label>
        <input id="contactPhoneForm" type="text" class="form-control"/>
        <label>Email</label>
        <input id="contactEmailForm" type="text" class="form-control"/>
        <input id="contactId" type="hidden"/>

        <div class="btn-align-right">
            <button id="cancelContactButton" type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Cancel
            </button>
            <button id="saveContactButton" type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span> Save
            </button>
        </div>

    </div>
</div>