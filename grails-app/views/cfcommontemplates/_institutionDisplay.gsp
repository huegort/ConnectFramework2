

    <g:hiddenField name="id" value="${institution.id}"></g:hiddenField>
    <g:hiddenField name="name" value="${institution.name}"></g:hiddenField>
    <g:hiddenField name="description" value="${institution.description}"></g:hiddenField>
    <g:hiddenField name="notes" value="${institution.notes}"></g:hiddenField>
    <g:hiddenField name="countryId" value="${institution.country.id}"></g:hiddenField>
    <g:hiddenField name="address1" value="${institution.address1}"></g:hiddenField>
    <g:hiddenField name="address2" value="${institution.address2}"></g:hiddenField>
    <g:hiddenField name="provence" value="${institution.provence}"></g:hiddenField>
    <g:hiddenField name="postcode" value="${institution.postcode}"></g:hiddenField>

    <dl>
            <div class="grid">
                <div class="grid__col grid__col--12-of-12">
                    <li class="list-group-item"><dt><g:message code="institution.name.label" default="Name"/></dt>
                        <dd>${institution.name}</dd>
                    </li>

                    <li class="list-group-item"><dt><g:message code="institution.description.label" default="Description"/></dt>
                        <dd>${institution.description}</dd>
                    </li>

                    <li class="list-group-item"><dt><g:message code="institution.notes.label" default="Notes"/></dt>
                        <dd>${institution.notes}</dd>
                    </li>

                    <li class="list-group-item"><dt><g:message code="institution.country.label" default="Country"/></dt>
                        <dd>${institution.country.name}</dd>
                    </li>

                    <li class="list-group-item"><dt><g:message code="institution.address1.label" default="Address"/></dt>
                        <dd>${institution.address1}</dd>
                        <dd>${institution.address2}</dd>
                        <dd>${institution.provence}</dd>
                    </li>

                    <li class="list-group-item"><dt><g:message code="institution.postcode.label" default="Postcode"/></dt>
                        <dd>${institution.postcode}</dd>
                    </li>
                </div>
            </div>

    </dl>

    <div class="btn-align-right">
        <button type="button" class="btn btn-default btn-sm" onclick="editInstitution()">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit
        </button>
    </div>
