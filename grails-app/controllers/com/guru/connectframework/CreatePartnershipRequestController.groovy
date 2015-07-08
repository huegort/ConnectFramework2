package com.guru.connectframework

import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.institution.Institution
import com.guru.connectframework.partnership.Partnership
import com.guru.connectframework.partnership.PartnershipLevel
import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory
import org.grails.datastore.mapping.validation.ValidationException

@Transactional
class CreatePartnershipRequestController {
    private static final log = LogFactory.getLog(this)
    def partnershipService
    def institutionService

    def index() {
        //log.debug(params.partnershipLevel.id)
        def partnershipLevel = PartnershipLevel.get(params.partnershipLevel.id)
        //def activityType = new ActivityType(params.activityType.ie)
        System.out.println(partnershipLevel)
        log.debug(partnershipLevel)

        [ partnershipLevel : partnershipLevel ]

    }
    def saveInstitution(Institution institution){
        log.debug (institution)
        if (institution == null) {
            respond  view: 'index'
            return
        }

        if (institution.hasErrors()) {
            respond institution.errors, view: 'index'
            return
        }

        institution.save flush: true
        respond  view: 'index'
    }
    @Transactional
    def createPartnershipRequest( ){
        //log.debug("sanity9 " + params.partnershipLevelId)
        def partnershipLevel = PartnershipLevel.get(params.partnershipLevelId)
        //log.debug("PL: "+partnershipLevel)
        def data = JSON.parse(params.sendData)
        log.debug("all: "+data)
        log.debug("institution: "+data.institution)
        log.debug("approval: "+data.approval)
        Institution institution1 = institutionService.createInstitutionFromJSON(data.institution)


        log.debug("institution:"+institution1)




        User fred = new User()
        fred.name = "joe2"
        fred.save(flush: true)

        partnershipService.createPartnership(data.approval,institution1,partnershipLevel, data.partnership, data.criteriaData)


        log.debug("5out in create partnership controler")

    }
    def test(){
        log.debug("sanity")
    }

    @Transactional
    /**
     * this is action is so that I can prototype what happens when I save a partnership
     */
    def testPartnershipSaveAndErrorMresssages( ){
        Partnership p2 = new Partnership()
        p2.name = "test1"
        p2.institution = Institution.get(1)
        p2.owner = User.get(1)

        try {
            p2.save(flush: true, failOnError: true)
        }catch (ValidationException e) {
            e.printStackTrace()
        }
    }
}
