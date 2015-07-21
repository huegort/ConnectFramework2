

    <g:hiddenField name="id" value="${institution.id}"></g:hiddenField>

    <dl>
            <div class="grid">
                <div class="grid__col grid__col--6-of-12">
                    <li class="list-group-item"><dt><g:message code="institution.name.label" default="Name"/></dt>
                        <dd>${institution.name}</dd>
                    </li>

                    <li class="list-group-item"><dt><g:message code="institution.description.label" default="Description"/></dt>
                        <dd>${institution.description}</dd>
                    </li>

                    <li class="list-group-item"><dt><g:message code="institution.notes.label" default="Notes"/></dt>
                        <dd>${institution.notes}</dd>
                    </li>
                </div>

                <div class="grid__col grid__col--6-of-12">
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


