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
                    <g:render template="partnershiplevelmodal/createPartnershipLevelForm" model="[section: section]"/>
                </fieldset>


                <div  class="grid" style="margin-top: 15px;">
                              <g:render template="createCriteria" model="[section: section]"/>


                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="submitLevel_${section}" type="button" class="btn btn-primary">Create</button>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        var rowId = 0
        $('#createCriteria_${section}').hide()
        $('#submitLevel_${section}').click(function () {
            console.log("submitlevel :"+ $('#partnershipLevelName_${section} :input').val())
            var formData = {}
            formData.criterias = []
            formData.name = $('#partnershipLevelName_${section} :input').val()
            formData.description = $('#descriptionLevel_${section} :input').val()
            formData.urlToDoc = $('#urlToDocLevel_${section} :input').val()
            formData.level = $('#partnershipLevel_${section} :input').val()
            formData.durationOfApprovalInYears = $('#durationOfApprovalInYears_${section} :input').val()


            //console.log(JSON.stringify(formData))
            $('#criteriaTable_${section} tbody tr').each(function () {

                formData.criterias.push($(this).find(' :input').serializeJSON())

            })


            console.log(JSON.stringify(formData))


            var request = $.ajax({
                type: 'POST',
                url: 'createLevel',
                dataType: 'html',
                data: {
                    name: formData.name,
                    description: formData.description,
                    urlToDoc: formData.urlToDoc,
                    level: formData.level,
                    durationOfApprovalInYears: formData.durationOfApprovalInYears,
                    criterias: JSON.stringify(formData.criterias)

                }
            })
            request.done(function( msg ) {

                    console.log("in success")
                    $('#myModalLevel').modal('hide');


            })
            request.fail(function( jqXHR, textStatus ) {
                    console.log("fail "+textStatus)
            })

        })

    })

</script>
