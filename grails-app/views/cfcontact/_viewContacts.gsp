<%--
  Created by IntelliJ IDEA.
  User: lmanuelcb
  Date: 07/16/2015
  Time: 12:00
--%>
<div class="modal fade" id="contactModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button id="closeModal" type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Contacts</h4>
            </div>

            <div class="modal-body">

                <div id="alertMessage" class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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

                <g:render template="/cfcontact/createEditContact"/>
                <div class="btn-align-right">
                    <button id="addContactButton" type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Contact
                    </button>
                </div>





                <%-- Create/Edit Contact --%>

            </div>

            <div class="modal-footer">
                <button id="closeModalButton" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

