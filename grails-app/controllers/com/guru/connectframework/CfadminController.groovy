package com.guru.connectframework

import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.criteria.Criteria
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.criteriatype.CriteriaType
import com.guru.connectframework.partnership.PartnershipLevel
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory

class CfadminController {
    private static final log = LogFactory.getLog(this)
    def partnershipLevelService
    def criteriaService

    def home() {
        def partnershipLevels = PartnershipLevel.getAll()
        def activityTypeCategories = ActivityCategory.getAll()


        [partnershipLevels : partnershipLevels,activityTypeCategories: activityTypeCategories]
    }
    @Transactional
    def createLevel() {
        //TODO when sequence number is null we get errors
        //log.debug(params.toString())
        //log.debug("criteriasxxx: "+params.criterias)
        PartnershipLevel partnershipLevel = partnershipLevelService.createPartnershipLevel()
        partnershipLevel.properties = params

        partnershipLevel.criteriaContainer = criteriaService.getCriteriaContainerForJSON(params.criterias)
        //log.debug("partnershipLevel:" +partnershipLevel)
        //log.debug("container:" +partnershipLevel.criteriaContainer)
        //log.debug("container set:" +partnershipLevel.criteriaContainer.setOfCriteria)


        partnershipLevel.criteriaContainer.save(failOnError: true)
        partnershipLevel.save(flush: true, failOnError: true)

        render  (view :"_partnershipLevelItem", model: [partnershipLevel: partnershipLevel])

    }
}
