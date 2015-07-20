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
        var contactData
        var editContactId

        $(document).ready(function () {

            listContacts()
            $('#alertMessage').hide()
            $('#createEditContactPanel').hide()

            $('#addContactButton').click(function () {
                $('#createEditContactPanel').show()
                $('#contactId').val('-1')
                $('#alertMessageText').text('')
            })

            //When Close Modal clear fields
            $('#cancelContactButton').click(function () {
                clearForm()
            })
            $('#closeModal').click(function () {
                clearForm()
            })
            $('#closeModalButton').click(function () {
                clearForm()
            })

            $('#saveContactButton').click(function () {

                // -1 represents a new contact
                if ($('#contactId').val() == -1) {
                    createNewContact()
                } else {
                    saveEditContact($('contactId').val())
                }


                //When click save, add it to the contact table and refresh table
                //if click save is a new contact do this. add hidden input that contains isContactNew=new or empty

                /*//Selects main contact for the partnership

                 //For each contact in the table, add it to the id="mainContactPartnertship options"
                 $('#mainContactPartnertship').find('option').remove()
                 $('#contactTable > tbody > tr').each(function () {
                 $('#mainContactPartnertship').append('<option id="' + $(this).attr('id') + '">' + $(this).closest('tr').find('td:first-child').html() + '</option>')
                 })*/
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
                })).append(jQuery('<input>', {
                    'name': 'contactId',
                    'value':  $('#mainContactPartnertship option:selected').val(),
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

        function createNewContact() {

            getFormValues()

            $.ajax({
                type: "POST",
                url: "${createLink(uri: '/cfcontact/createContact/')}",
                data: {
                    contact: JSON.stringify(contactData)
                },
                success: function (data) {

                    contactData = ''
                    listContacts()
                    clearForm()

                }
            })
        }

        function saveEditContact() {
            getFormValues()

            $.ajax({
                type: "POST",
                url: "${createLink(uri: '/cfcontact/updateContact/')}",
                data: {
                    contact: JSON.stringify(contactData),
                    contactId: editContactId
                },
                success: function (data) {

                    contactData = ''
                    editContactId = ''
                    listContacts()
                    clearForm()
                }
            })
        }

        function editContact(idValue) {
            //TODO append contact to the inputs
            $('#alertMessageText').text('')
            viewEditContactData(idValue)
            editContactId = idValue

            $('#createEditContactPanel').show()


        }

        //Create ajax call to list contacts in the system with no institution
        function listContacts() {
            //Link to list contacts http://localhost:8080/ConnectFramework2/cfcontact/listContactsNoInst
            $.ajax({
                type: 'POST',
                url: '${createLink(uri: '/cfcontact/listContactsNoInst/')}',
                success: function (data) {

                    $('#contactTable > tbody').empty()
                    $.each(data, function (index, element) {

                        $('#contactTable tbody').append('<tr id="' + element.id + '">' +
                                '<td>' + element.title + ' ' + element.firstName + ' ' + element.lastName + '</td>' +
                                '<td>' + element.phone + '</td>' +
                                '<td>' + element.email + '</td>' +
                                '<td><button onclick="editContact(' + element.id + ')" class="btn btn-default btn-sm" id="editRow' + length + '">' +
                                '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
                                '</button>' +
                                '<button onclick="deleteContact(' + element.id + ')"    style="margin-left: 5px;" class="btn btn-default btn-sm" id="deleteRow' + length + '">' +
                                '<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>' +
                                '</button>' +
                                '</td>' +
                                '</tr>')
                    })
                    addMainContacts()

                }
            })
        }

        //delete contact
        function deleteContact(value) {
            var warning = confirm('Are you sure?')

            if (warning == true) {
                $.ajax({
                    type: 'POST',
                    url: '${createLink(uri: '/cfcontact/deleteContact')}',
                    data: {
                        contactId: value
                    },
                    success: function (data) {
                        $('#alertMessageText').append(data.message)
                        $('#alertMessage').show()
                    }
                    //TODO add success message
                })

                var rowId = ' tr#' + value

                $('#contactTable tbody' + rowId).remove()
                addMainContacts()
            } else {
                return false
            }
        }

        function viewEditContactData(value) {
            $.ajax({
                type: 'POST',
                url: '${createLink(uri:'/cfcontact/findContact')}',
                data: {
                    contactId: value
                },
                success: function (data) {
                    $('#contactTitleForm').val(data.title)
                    $('#contactFirstForm').val(data.firstName)
                    $('#contactLastForm').val(data.lastName)
                    $('#contactRoleForm').val(data.roleInInstitution)
                    $('#contactPhoneForm').val(data.phone)
                    $('#contactEmailForm').val(data.email)
                    $('#contactId').val(data.id)
                }
            })

        }

        function clearForm() {
            $('#contactTitleForm').val("")
            $('#contactFirstForm').val("")
            $('#contactLastForm').val("")
            $('#contactRoleForm').val("")
            $('#contactPhoneForm').val("")
            $('#contactEmailForm').val("")
            $('#createEditContactPanel').hide()
        }

        function getFormValues() {
            contactData = {

                title: $('#contactTitleForm').val(),
                firstName: $('#contactFirstForm').val(),
                lastName: $('#contactLastForm').val(),
                roleInInstitution: $('#contactRoleForm').val(),
                phone: $('#contactPhoneForm').val(),
                email: $('#contactEmailForm').val()
            }
        }

        function addMainContacts() {
            if ($('#contactTable tbody').children().length == 0) {

            } else {
                $('#mainContactPartnertship').find('option').remove()
                $('#contactTable > tbody > tr').each(function () {
                    $('#mainContactPartnertship').append('<option id="' + $(this).attr('id') + '">' + $(this).closest('tr').find('td:first-child').html() + '</option>')
                })
            }
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
                                    <label>Main Contact</label>

                                    <div class="grid">
                                        <div class="grid__col grid__col--8-of-12">
                                            <select id="mainContactPartnertship" class="form-control">
                                                <option disabled>Please Add a Contact</option>
                                            </select>
                                        </div>

                                        <div class="grid__col grid__col--4-of-12">
                                            <div id="contact">
                                                <g:render template="/cfcontact/viewContacts"/>
                                                <div>
                                                    <button type="button" class="btn btn-default btn-sm"
                                                            data-toggle="modal"
                                                            data-target="#contactModal">
                                                        <span class="glyphicon glyphicon-user"
                                                              aria-hidden="true"></span>  Manage Contacts
                                                    </button>
                                                </div>

                                            </div>
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