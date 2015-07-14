<div id="criteriaDiv" class="grid__col grid__col--12-of-12">
    <div id="createCriteria" class="panel panel-default">
        <div class="panel-heading">Add Criteria</div>
        <div class="panel-body">
            <table id="criteriaTable" class="table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Type</th>
                    <th>Seq#</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <div style="text-align: right;">
        <button id="addCriteria" type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Criteria
        </button>
    </div>
</div>
<script>
    $(document).ready(function () {
        var rowId = 0
        $('#addCriteria').click(function () {
                   rowId += 1
                   $('#criteriaTable tbody').append(   '<tr id="tableRow' + rowId +'">' +
                        '<td>' +
                            '<input type="hidden" name="command" value="">' +
                            '<input type="hidden" name="criteriaId" value="-1">' +
                            '<input type="text" name="name" class="form-control">' +
                        '</td> ' +
                        '<td>' +
                            '<input type="text" name="description" class="form-control">' +
                        '</td> ' +
                        '<td> ' +
                            '<select name="dataType" class="form-control"> ' +
                                '<option value=${com.guru.connectframework.criteriatype.CriteriaType.STRING}>Text</option> ' +
                                '<option value=${com.guru.connectframework.criteriatype.CriteriaType.FILE}>Document</option> ' +
                                '<option value=${com.guru.connectframework.criteriatype.CriteriaType.DATE}>Date</option> ' +
                            '</select> ' +
                        '</td> ' +
                        '<td>' +
                            '<input type="text" name="sequenceNumber" class="form-control" maxlength="2" style="width: 50px;">' +
                        '</td> ' +

                        '<td>' +
                            '<button type="button" class="btn btn-default btn-sm" onclick="removeRow('+rowId+')"> ' +
                                '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>  ' +
                            '</button>' +
                        '</td>' +
                        '</tr>')
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




