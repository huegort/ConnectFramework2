<%--
  Created by IntelliJ IDEA.
  User: andrewbeatty
  Date: 01/07/15
  Time: 12:07
--%>

<%@ page import="com.guru.connectframework.institution.Institution" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Institute Partnership Request</title>
    <meta name="layout" content="bootstrap">


    <script>
        var contactData
        var editContactId

        $(document).ready(function () {


            // Navigation for tabs --Starts--
            $('#contactPanel').hide()
            $('#levelRequestPanel').hide()

            $('li > a').click(function () {
                $('li').removeClass();
                $(this).parent().addClass('active');
            });

            $('#instituteLink').click(function () {
                $('#')
                $('#institutionPanel').show()
                $('#contactPanel').hide()
                $('#levelRequestPanel').hide()
            })

            $('#contactLink').click(function () {
                $('#contactPanel').show()
                $('#institutionPanel').hide()
                $('#levelRequestPanel').hide()
            })

            $('#levelLink').click(function () {
                $('#levelRequestPanel').show()
                $('#institutionPanel').hide()
                $('#contactPanel').hide()
            })
            // -- Ends --

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

            /*$('#closeModal').click(function () {
                clearForm()
            })
            $('#closeModalButton').click(function () {
                clearForm()
            })*/

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

            $('#submitInstitution').click(function () {
                createInstitution()
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
                    'value':  ${partnership.partnershipLevel.id },
                    'type': 'hidden'
                })).append(jQuery('<input>', {
                    'name': 'activityTypeId',
                    'value':  ${activityType.id },
                    'type': 'hidden'
                })).append(jQuery('<input>', {
                    'name': 'contactId',
                    'value': $('#mainContactPartnertship option:selected').val(),
                    'type': 'hidden'
                }));
                newForm.submit();


                //$.ajax({
                //    type: "POST",
                //    url: "createPartnershipRequest",
                //    dataType: 'json',
                //    data: {sendData : JSON.stringify(formData), partnershipLevelId : ${partnership.partnershipLevel.id }},
                //    cache: false,
                //    success: function (data) {
                //    }
                //});

            });



        });

        //added ajax call to create a new institution
        function createInstitution() {
            $.ajax({
                type: 'POST',
                url: '${createLink(uri: '/cfCreatePartnershipRequest/createInstitution/')}',
                data: {
                    institution: JSON.stringify($("#institutionDiv :input").serializeJSON())
                },
                success: function (data) {
                    $('#institutionDiv').empty()
                    appendInstitution(data)
                    //When created it adds the institution view and the create button
                    console.log(data)
                }
            })
        }

        function appendInstitution(data) {
            $('#institutionDiv').append('<input type="hidden" name="id" value="' + data.id + '">' +
                    '<input type="hidden" name="name" value="' + data.name + '">' +
                    '<input type="hidden" name="description" value="' + data.description + '">' +
                    '<input type="hidden" name="notes" value="' + data.feedback + '">' +
                    '<input type="hidden" name="countryId" value="' + data.country.id + '">' +
                    '<input type="hidden" name="address1" value="' + data.address1 + '">' +
                    '<input type="hidden" name="address2" value="' + data.address2 + '">' +
                    '<input type="hidden" name="provence" value="' + data.provence + '">' +
                    '<input type="hidden" name="postcode" value="' + data.postcode + '">' +
                    '<dl><div class="grid">' +
                    '<div class="grid__col grid__col--6-of-12">' +
                    '<li class="list-group-item"><dt>Name</dt><dd>' + data.name + '</dd></li>' +
                    '<li class="list-group-item"><dt>Description</dt><dd>' + data.description + '</dd></li>' +
                    '<li class="list-group-item"><dt>Notes</dt><dd>' + data.feedback + '</dd></li>' +
                    '</div>' +
                    '<div class="grid__col grid__col--6-of-12">' +
                    '<li class="list-group-item"><dt>Country</dt><dd>' + data.country.name + '</dd></li>' +
                    '<li class="list-group-item"><dt>Address</dt><dd>' + data.address1 + '</dd><dd>' + data.address2 + '</dd><dd>' + data.provence + '</dd></li>' +
                    '<li class="list-group-item"><dt>Postcode</dt><dd>' + data.postcode + '</dd></li>' +
                    '</div>' +
                    '</div>' +
                    '</dl>' +
                    '<div class="btn-align-right"> <button type="button" class="btn btn-default btn-sm" onclick="editInstitution()"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit</button></div>')
        }

        function editInstitution() {
            var data = {}
            data.institution = $("#institutionDiv :input").serializeJSON();
            console.log(JSON.stringify(data))

            //TODO get the country list as select option

            $('#institutionDiv').empty()
            $('#institutionDiv').append('<input type="hidden" name="id" value="' + data.institution.id + '">' +
                            '<label>Name</label>' +
                    '<input class="form-control" type="text" name="name" value="' + data.institution.name + '">' +
                            '<label>Description</label>' +
                    '<input class="form-control" type="text" name="description" value="' + data.institution.description + '">' +
                            '<label>Notes</label>' +
                    '<input class="form-control" type="text" name="notes" value="' + data.institution.notes + '">' +
                            '<label>Country</label>' +
                    '<input class="form-control" type="text" name="countryId" value="' + data.institution.countryId + '">' +
                            '<label>Address1</label>' +
                    '<input class="form-control" type="text" name="address1" value="' + data.institution.address1 + '">' +
                            '<label>Address2</label>' +
                    '<input class="form-control" type="text" name="address2" value="' + data.institution.address2 + '">' +
                            '<label>Provence</label>' +
                    '<input class="form-control" type="text" name="provence" value="' + data.institution.provence + '">' +
                            '<label>Postcode</label>' +
                    '<input class="form-control" type="text" name="postcode" value="' + data.institution.postcode + '">' +
                    '<div class="btn-align-right"> <button type="button" class="btn btn-default btn-sm" onclick="updateInstitution()"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Done</button></div>')
        }

        function updateInstitution() {
            //Submits edit to the controller through ajax call
            $.ajax({
                type: 'POST',
                url: '${createLink(uri: '/cfCreatePartnershipRequest/updateInstitution/')}',
                data: {
                    institution: JSON.stringify($("#institutionDiv :input").serializeJSON())
                },
                success: function (data) {
                    $('#institutionDiv').empty()
                    appendInstitution(data)
                    //TODO when updated add the institution view and the add button
                    console.log(data)
                }
            })
        }

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
                <g:if test="${createNewInstitution}">

                </g:if>
                <g:else>
                data: {
                    instituteId: ${partnership.institution.id}
                },
                </g:else>

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

            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="h4"><g:fieldValue
                            bean="${partnership.partnershipLevel}"
                            field="name"/></div>
                </div>

                <div class="panel-body">

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
                            <span class="property-value" aria-labelledby="level-label"><g:fieldValue
                                    bean="${partnership.partnershipLevel}"
                                    field="description"/></span>
                        </div>
                    </div>

                    <div id="stepTabs" style="margin-bottom: 10px;">
                        <ul class="nav nav-tabs">
                            <li role="presentation" class="active"><a id="instituteLink">1. Create/Edit Institution</a>
                            </li>
                            <li role="presentation"><a id="contactLink">2. Add Contacts</a></li>
                            <li role="presentation"><a id="levelLink">3. Request Level</a></li>
                        </ul>
                    </div>

                    <div id="institutionPanel" class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Institute Details</h3>
                        </div>

                        <div id="institutionDiv" class="panel-body">

                            <fieldset class="form">
                                <g:if test="${createNewInstitution == true}">
                                    <g:render template="instituteform"
                                              model="[institution: partnership.institution]"/>
                                </g:if>
                                <g:else>
                                    <g:render template="/cfcommontemplates/institutionDisplay"
                                              model="[institution: partnership.institution]"/>
                                </g:else>

                            </fieldset>

                        </div>
                    </div>


                    <div id="contactPanel" class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Institution Contact Details</h3>
                        </div>

                        <div id="contactDiv" class="panel-body">

                            <div id="alertMessage" class="alert alert-success alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>

                                <div id="alertMessageText"></div>
                            </div>
                            <%-- View all Contacts that belongs to an Institution --%>

                            <table id="contactTable" class="table">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Options</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

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
                                            <span class="glyphicon glyphicon-floppy-saved"
                                                  aria-hidden="true"></span> Save
                                        </button>
                                    </div>

                                </div>
                            </div>


                            <div class="btn-align-right">
                                <button id="addContactButton" type="button" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Contact
                                </button>
                            </div>

                            <%-- Currently not using the _viewContacts & _createEditContact
                            <div class="btn-align-right">
                                <button type="button" class="btn btn-default btn-sm"
                                        data-toggle="modal"
                                        data-target="#contactModal">
                                    <span class="glyphicon glyphicon-user"
                                          aria-hidden="true"></span>  Manage Contacts
                                </button>
                            </div>
                            --%>

                        </div>
                    </div>

                    <div id="levelRequestPanel" class="panel panel-default">
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
                                                      model="[approvers: partnership.partnershipLevel.possibleApprovers, endorsers: partnership.partnershipLevel.possibleEndorsers, approval: partnership.approval]"/>

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
                                                <%--<g:render template="/cfcontact/viewContacts"/>--%>
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
                                            <g:render template="/cfcommontemplates/criteriadataform"
                                                      var="criteria"
                                                      collection="${partnership.partnershipLevel.criteria}"/>
                                        </fieldset>

                                    </div>

                                </div>
                            </div>

                            <div class="btn-align-right">
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
</div>

</body>
</html>