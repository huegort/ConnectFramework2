package com.guru.connectframework

import com.guru.connectframework.criteria.Criteria
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.partnership.PartnershipLevel
import grails.transaction.Transactional
import groovy.json.JsonSlurper
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement

@Transactional
class CriteriaService {
    private static final log = LogFactory.getLog(this)

    CriteriaContainer getCriteriaContainerForJSON( String criteriaJSON){
        CriteriaContainer criteriaContainer = new CriteriaContainer()
        criteriaContainer.save(failOnError: true,flush: true)

        def list = new JsonSlurper().parseText( criteriaJSON )


        list.each {
            Criteria criteria = getCriterisForJSON(it)

            criteria.container = criteriaContainer
            criteria.save(failOnError: true, flush: true)



            criteriaContainer.setOfCriteria.add(criteria)
            criteriaContainer.setOfCriteria.each {log.debug("again:"+it.name)}

        }

        return criteriaContainer

    }
    Criteria getCriterisForJSON(def jsonMap){
       Criteria criteria
        int criteriaId = Integer.parseInt(jsonMap.criteriaId)
        if (criteriaId == -1){
            criteria = new Criteria(jsonMap)
        }else {
            criteria = Criteria.get(criteriaId)
            criteria.properties = jsonMap

        }

        return criteria

    }
}
