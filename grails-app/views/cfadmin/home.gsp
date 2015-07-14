<%--
  Created by IntelliJ IDEA.
  User: lmanuelcb
  Date: 07/13/2015
  Time: 14:04
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <script>
        $(document).ready(function () {
            var rowId = 0
            $('#createCriteria').hide()
            $('#submitLevel').click(function (){
                var formData = {}
                var criteriaContainer = []
                formData.name = $('#partnershipLevelName :input').val()
                formData.description = $('#descriptionLevel :input').val()
                formData.urlToDoc = $('#urlToDocLevel :input').val()
                formData.level = $('#partnershipLevel :input').val()

                //console.log(JSON.stringify(formData))
                $('#criteriaTable tbody tr').each(function () {
                    criteriaContainer.push({criteriaId: $(this).find('input[name=criteriaId]').val() ,name: $(this).find('td :input').val(), type: $(this).find(':selected').text(),command: $(this).find('input[name=command]').val()})
                    //criteriaContainer += {name: $(this).attr('id')}
                    //console.log($(this).find(':input').val())
                    //console.log($(this).attr('id'))
                })

                formData.criteriaContainer = criteriaContainer
                console.log(JSON.stringify(formData))

                $.ajax({
                    type: 'POST',
                    url: 'createLevel',
                    dataType: 'json',
                    data: {
                        levelName: formData.name,
                        levelDescription : formData.description,
                        levelUrlToDoc: formData.urlToDoc,
                        level: formData.level,
                        criteriaContainer: criteriaContainer
                    },
                    success: function (data) {

                    }
                })
            })

            $('#addCriteria').click(function () {
                rowId += 1
                $('#criteriaTable tbody').append(   '<tr id="tableRow' + rowId +'"><input type="hidden" name="command" value=""><input type="hidden" name="criteriaId" value="-1"><td><input type="text" class="form-control"></td> ' +
                                                    '<td> <select class="form-control"> <option>Text</option> <option>Document</option> <option>Date</option> </select> </td> ' +
                                                    '<td><button type="button" class="btn btn-default btn-sm" onclick="removeRow('+rowId+')"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Remove </button></td></tr>')
                $('#createCriteria').show()
            })

        })

        function removeRow(value) {
            var row = '#tableRow' + value
            console.log(row)
            $(row).hide()
            $(row).find('input[name=command]').val('removed')
            if ($('#criteriaTable tbody').find("tr").length === 0 ) {
                $('#createCriteria').hide()
            }
        }

        function addCriteria(name, cType) {
            if (cType == 'text') {
                var criteriaData = '<div class="grid__col grid__col--4-of-12"> <label>' + name + '</label> </div> <div class="grid__col grid__col--8-of-12"> <input class="form-control" type="' + cType + '"> </div>';
                $('#addLevelCriteria').append(criteriaData);
            }
            else if (cType == 'file') {
                var criteriaData = '<div class="grid__col grid__col--4-of-12"> <label>' + name + '</label> </div> <div class="grid__col grid__col--8-of-12"> <input type="' + cType + '"> </div>';
                $('#addLevelCriteria').append(criteriaData);
            } else if (cType == 'date'){
                var criteriaData = '<div class="grid__col grid__col--4-of-12"> <label>' + name + '</label> </div> <div class="grid__col grid__col--8-of-12"> <input type="' + cType + '"> </div>';
                $('#addLevelCriteria').append(criteriaData);
            }
        }


    </script>
</head>

<body>
<div class="main-body">
    <div class="grid">
        <div class="grid__col grid__col--12-of-12">
            <h1>CF_Admin Interface</h1>
        </div>
    </div>
    <div class="grid">
        <div class="grid__col grid__col--9-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Partnership Levels</h3>
                </div>
                <div class="panel-body">
                    <div class="grid">
                        <div class="grid__col grid__col--1-of-12">
                            <button type="button" class="btn btn-default" data-toggle="modal"
                                    data-target="#myModalLevel">Add Level
                            </button>
                            <p></p>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Duration</th>
                                <th>Url to documentation</th>
                                <th>Level</th>
                            </tr>
                            <g:render template="displayPartnershipLevels"
                                      var="partnershipLevel"
                                      collection="${partnershipLevels}"/>
                        </table>

                    </div>

                    <!-- Adding Partnership Level Modal -->
                    <div class="modal fade" id="myModalLevel" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Create New Level</h4>
                                </div>
                                <div class="modal-body">
                                    <fieldset class="form">
                                        <g:render template="createPartnershipLevelForm"/>
                                    </fieldset>
                                    <fieldset class="form">
                                        <g:render template="createActivityTypeForm"/>
                                    </fieldset>

                                    <div  class="grid" style="margin-top: 15px;">
                                        <div class="grid__col grid__col--12-of-12">
                                            <div id="createCriteria" class="panel panel-default">
                                                <div class="panel-heading">Add Criteria</div>
                                                <div class="panel-body">
                                                    <g:render template="createCriteria"/>
                                                </div>
                                            </div>
                                            <div style="text-align: right;">
                                                <button id="addCriteria" type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Criteria
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button id="submitLevel" type="button" class="btn btn-primary">Create</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activity Categories</h3>
                </div>
                <div class="panel-body">
                    <div class="grid">
                        <div class="grid__col grid__col--1-of-12">
                            <button class="btn btn-default">Add Category</button>
                            <p></p>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Category Name</th>
                                <th>Date Created</th>
                                <th>Activity Type</th>
                                <th>Options</th>
                            </tr>
                            <tr>
                                <td>Category A</td>
                                <td>12/08/2014</td>
                                <td>Exchange</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="Edit">Edit</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activity Type</h3>
                </div>
                <div class="panel-body">
                    <div class="grid">
                        <div class="grid__col grid__col--1-of-12">
                            <button class="btn btn-default">Add Activity</button>
                            <p></p>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Activity Type</th>
                                <th>Date Created</th>
                                <th>Institute</th>
                                <th>Options</th>
                            </tr>
                            <tr>
                                <td>Activity D</td>
                                <td>12/08/2014</td>
                                <td>Institute A</td>
                                <td>
                                    <button class="btn btn-default btn-sm" value="Edit">Edit</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid__col grid__col--3-of-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Search</h3>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" style="padding: 9px 12px;">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>