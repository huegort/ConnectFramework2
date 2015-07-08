package com.guru.connectframework

import com.guru.connectframework.institution.Country
import com.guru.connectframework.institution.Institution
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement
import org.grails.datastore.mapping.validation.ValidationException

@Transactional
class InstitutionService {
    private static final log = LogFactory.getLog(this)

    def createInstitutionFromJSON(JSONElement institutionJSON) {
        Institution institution

        int id = Integer.parseInt(institutionJSON.id)
        log.debug("inst id:"+id)
        if (id == -1){
           institution= new Institution(institutionJSON)
            // ACB: issue with selects in JSON I am doing this manually
            if (institution.country == null){
                int countryId = Integer.parseInt(institutionJSON.countryId)
                institution.country = Country.get(countryId)
            }
            log.debug("in save")
            try {
                institution.save(flush: true, failOnError: true)
            }catch (ValidationException e) {
                e.printStackTrace()
            }
       }else{
            log.debug("in get")
            institution = Institution.get(id)
        }


        return institution

    }
}
