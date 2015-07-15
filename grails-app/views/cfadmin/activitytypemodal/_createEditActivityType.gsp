<div class="modal fade" id="ModalActivityType" tabindex="-1" role="dialog"
     aria-labelledby="ModalLabelActivityType">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Create Activity Type</h4>
            </div>
            <div class="modal-body">

                <fieldset class="form">
                    <g:render template="activitytypemodal/createActivityTypeForm"
                              model="[section: section]"/>
                </fieldset>

                <div  class="grid" style="margin-top: 15px;">
                    <g:render template="createCriteria"
                              model="[section: section]"/>


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
            console.log("in create activity Type")
            var formData = {}
            formData.criterias = []
            category_${section}
            formData.name                = $('#name_${section} :input').val()
            formData.description        = $('#description_${section} :input').val()
            formData.category           = $('#category_${section} :input').val()
            formData.urlToDoc           = $('#urlToDoc_${section} :input').val()
            formData.document           = $('#document_${section} :input').val()
            formData.partnershipLevel   = $('#partnershipLevel_${section} :input').val()
            formData.durationOfApprovalInYears = $('#durationOfApprovalInYears_${section} :input').val()

            var categoryId = $('#category_${section} :input').val()

            //console.log(JSON.stringify(formData))
            $('#criteriaTable_${section} tbody tr').each(function () {
                formData.criterias.push($(this).find(' :input').serializeJSON())

            })


            console.log(JSON.stringify(formData))


            var request = $.ajax({
                type: 'POST',
                url: 'createActivityType',
                dataType: 'html',
                data: {
                    name:               formData.name,
                    description:        formData.description,
                    categoryId:         formData.category,
                    urlToDoc:           formData.urlToDoc,
                    documentId:         formData.document,
                    partnershipLevelId: formData.partnershipLevel,
                    durationOfApprovalInYears: formData.durationOfApprovalInYears,
                    criterias: JSON.stringify(formData.criterias)

                }
            })
            request.done(function( msg ) {

                console.log("in success xx about to add "+msg+"\nto:"+categoryId)
                $('#displayActivityTypesTable_'+categoryId).append(msg);
                $('#ModalActivityType').modal('hide');



            })
            request.fail(function( jqXHR, textStatus ) {
                console.log("fail "+textStatus)
                alert("We could not create this activity type because an error occured while processing the data ")
                $('#ModalActivityType').modal('hide');
            })

        })

    })

</script>
