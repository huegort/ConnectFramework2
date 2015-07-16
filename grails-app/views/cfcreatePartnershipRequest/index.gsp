<%--
  Created by IntelliJ IDEA.
  User: andrewbeatty
  Date: 01/07/15
  Time: 12:07
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Institute Partnership Request</title>
    <meta name="layout" content="bootstrap">


    <script>
        var instituteContactsData = {contact: []}
        var newContactData = {contact: []}
        var editedContactData = {contact: []}
        var length = 0
        $(document).ready(function () {

            $('#createEditContactPanel').hide()
            $('#addContactButton').click(function () {
                $('#createEditContactPanel').show()
                $('#isContactNew').attr('isContactNew','new')
            })
            $('#saveContactButton').click(function () {

                //When click save, add it to the contact table and refresh table
                //if click save is a new contact do this. add hidden input that contains isContactNew=new or empty
                if ($('#isContactNew').attr('isContactNew') == 'new') {
                    length++
                    newContactData.contact.push({
                        title: $('#contactTitleForm').val(),
                        firstName: $('#contactFirstForm').val(),
                        lastName: $('#contactLastForm').val(),
                        roleInInstitution: $('#contactRoleForm').val(),
                        phone: $('#contactPhoneForm').val(),
                        email: $('#contactEmailForm').val(),
                        institution: []
                    })
                    console.log('In Contact is new')
                    $('#contactTable tbody').append('<tr id="newRow' + length + '">' +
                            '<td>' + $('#contactTitleForm').val() + ' ' + $('#contactFirstForm').val() + ' ' + $('#contactLastForm').val() + '</td>' +
                            '<td>' + $('#contactPhoneForm').val() + '</td>' +
                            '<td>' + $('#contactEmailForm').val() + '</td>' +
                            '<td><button onclick="editNewContact()" class="btn btn-default btn-sm" id="editRow' + length + '">' +
                            '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
                            '</button>' +
                            '<button onclick="deleteNewContact()" class="btn btn-default btn-sm" id="deleteRow' + length + '">' +
                            '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>' +
                            '</button>' +
                            '</td>' +
                            '</tr>')
                }
                //TODO if contact is not new,
                if ($('#isContactNew').attr('isContactNew') == ''){
                    editedContactData.contact.push({
                        id: $('#contactId').val(),
                        title: $('#contactTitleForm').val(),
                        firstName: $('#contactFirstForm').val(),
                        lastName: $('#contactLastForm').val(),
                        roleInInstitution: $('#contactRoleForm').val(),
                        phone: $('#contactPhoneForm').val(),
                        email: $('#contactEmailForm').val(),
                        institution: []
                    })
                    console.log('In Contact is not new')

                    //TODO replace row thats been edited
                }

                //Clear form when save
                //$('#contactTable tbody').val("")
                $('#contactTitleForm').val("")
                $('#contactFirstForm').val("")
                $('#contactLastForm').val("")
                $('#contactRoleForm').val("")
                $('#contactPhoneForm').val("")
                $('#contactEmailForm').val("")
                $('#isContactNew').attr('isContactNew','')
                $('#createEditContactPanel').hide()


            })
            $("#submitCriteria").click(function () {
                var formData = {};
                formData.institution = $("#institutionDiv :input").serializeJSON();
                formData.criteriaData = $("#criteriaDiv :input").serializeJSON();
                formData.approval = $("#approvalDiv :input").serializeJSON();
                formData.partnership = $("#partnershipDiv :input").serializeJSON();
                // alert(criteriaData);
                console.log(formData);

                event.preventDefault();

                // TODO I should use the form itself
                var newForm = jQuery('<form>', {
                    'action': 'createPartnershipRequest',

                }).append(jQuery('<input>', {
                    'name': 'sendData',
                    'value': JSON.stringify(formData),
                    'type': 'hidden'
                })).append(jQuery('<input>', {
                    'name': 'partnershipLevelId',
                    'value':  ${partnershipLevel.id },
                    'type': 'hidden'
                })).append(jQuery('<input>', {
                    'name': 'activityTypeId',
                    'value':  ${activityType.id },
                    'type': 'hidden'
                }));
                newForm.submit();

                //$.ajax({
                //    type: "POST",
                //    url: "createPartnershipRequest",
                //    dataType: 'json',
                //    data: {sendData : JSON.stringify(formData), partnershipLevelId : ${partnershipLevel.id }},
                //    cache: false,
                //    success: function (data) {
                //    }
                //});
//

            });

        });

        //TODO create ajax call to get the current contacts in the system
        function getCurrentContacts() {
            instituteContactsData //Get Contact Data and put it here


            $('#contactTable tbody').append('<tr id="newRow' + length + '">' +
                    '<td>' + $('#contactTitleForm').val() + ' ' + $('#contactFirstForm').val() + ' ' + $('#contactLastForm').val() + '</td>' +
                    '<td>' + $('#contactPhoneForm').val() + '</td>' +
                    '<td>' + $('#contactEmailForm').val() + '</td>' +
                    '<td><button onclick="editNewContact()" class="btn btn-default btn-sm" id="editRow' + length + '">' +
                    '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
                    '</button>' +
                    '<button onclick="deleteNewContact()" class="btn btn-default btn-sm" id="deleteRow' + length + '">' +
                    '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>' +
                    '</button>' +
                    '</td>' +
                    '</tr>')
        }

        function editNewContact() {
            console.log('Inside edit new contact')
        }

        function editOldContact(idValue) {
            //TODO Find contact by id in instituteContactsData
            //TODO append contact to the inputs

            $('#createEditContactPanel').show()
        }

        function deleteNewContact() {
            console.log('Inside delete new contact')
        }

        function deleteOldContact() {

        }

        function viewContactData() {
            console.log(newContactData)
        }


    </script>
</head>

<body>
<div class="main-body">

    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <h1>Create Intitute Parnership Request</h1>

            <h3><span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${partnershipLevel}"
                                                                                         field="name"/></span></h3>

            <div class="panel panel-default">
                <div class="panel-body">
                    Before you can create an request for this activity (<em>${activityType.name}</em>) we need to
                <g:if test="${createNewInstitution == true}">
                    create the institution and
                </g:if>
                <g:else>

                </g:else>
                request a partnership with this institution at the appropriate level

                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Description of Partnership Level required for this activity</h3>
                </div>

                <div class="panel-body">
                    <span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${partnershipLevel}"
                                                                                             field="description"/></span>
                </div>
            </div>

            <div class="grid">
                <div class="grid__col grid__col--6-of-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Institute Details</h3>
                        </div>

                        <div id="institutionDiv" class="panel-body">

                            <fieldset class="form">
                                <g:if test="${createNewInstitution == true}">
                                    <g:render template="instituteform"/>
                                </g:if>
                                <g:else>
                                    <g:render template="/cfcommontemplates/institutionDisplay"
                                              model="[institution: institution]"/>
                                </g:else>

                            </fieldset>

                        </div>
                    </div>
                </div>

                <div class="grid__col grid__col--6-of-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Request Level</h3>
                        </div>

                        <div class="panel-body">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div id="partnershipDiv">
                                        <fieldset class="form">
                                            <g:render template="partnershipform"/>
                                        </fieldset>

                                    </div>


                                    <div id="approvalDiv">
                                        <fieldset class="form">

                                            <g:render template="/cfcommontemplates/approvalform"
                                                      model="[approvers: partnershipLevel.possibleApprovers, endorsers: partnershipLevel.possibleEndorsers, approval: approval]"/>

                                        </fieldset>

                                    </div>

                                    <div id="contact">
                                        <g:render template="/cfcontact/viewContacts"/>
                                        <div class="btn-align-right">
                                            <button type="button" class="btn btn-default btn-sm" data-toggle="modal"
                                                    data-target="#contactModal">
                                                <span class="glyphicon glyphicon-user"
                                                      aria-hidden="true"></span>  Manage Contacts
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Due diligence</h3>
                                </div>

                                <div class="panel-body">
                                    <div id="criteriaDiv">

                                        <fieldset class="form">
                                            <g:render template="/cfcommontemplates/criteriadataform" var="criteria"
                                                      collection="${partnershipLevel.criteria}"/>
                                        </fieldset>

                                    </div>

                                </div>
                            </div>

                            <div style="text-align: right;">
                                <fieldset class="buttons">
                                    <g:submitButton id="submitCriteria" name="create"
                                                    class="save btn btn-default btn-sm"
                                                    style="margin-top: 5px;"
                                                    value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid">
        <div class="grid__col grid__col--6-of-12">
        </div>
    </div>
</div>

</body>
</html>