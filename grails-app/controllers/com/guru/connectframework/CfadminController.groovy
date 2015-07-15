package com.guru.connectframework

import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.partnership.PartnershipLevel
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory

class CfadminController {
    private static final log = LogFactory.getLog(this)
    def partnershipLevelService
    def activityTypeService
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

        render  (view :"partnershiplevel/_partnershipLevelRow", model: [partnershipLevel: partnershipLevel])

    }
    @Transactional
    def createActivityType() {
        //TODO when sequence number is null we get errors
        log.debug(params.toString())
        log.debug("criteriasxxx: "+params.criterias)
        ActivityType activityType= activityTypeService.createActivityTypeFromParams(params)
        log.debug("activity Type : "+ activityType)
        activityType.criteriaContainer = criteriaService.getCriteriaContainerForJSON(params.criterias)
        //log.debug("partnershipLevel:" +partnershipLevel)
        //log.debug("container:" +partnershipLevel.criteriaContainer)
        //log.debug("container set:" +partnershipLevel.criteriaContainer.setOfCriteria)


        activityType.criteriaContainer.save(failOnError: true)
        activityType.save(flush: true, failOnError: true)

        render  (view :"activitytype/_activityTypeRow", model: [activityType: activityType])

    }
}
