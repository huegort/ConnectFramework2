



    <div>
        <label for=${criteria.id}>
            ${criteria.name}
        </label>


        <g:render template="${criteria.dataType.formInput}" model="[criteria : criteria]"/>

    </div>


