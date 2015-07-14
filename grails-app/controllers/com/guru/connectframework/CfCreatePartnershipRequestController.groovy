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
class CfCreatePartnershipRequestController {
    private static final log = LogFactory.getLog(this)
    def partnershipService
    def institutionService
    def approvalService



    def index() {
        //log.debug(params.partnershipLevel.id)
        def institution
        def partnershipLevel = PartnershipLevel.get(params.partnershipLevel.id)
        //def activityType = new ActivityType(params.activityType.ie)
        Approval tempApproval = approvalService.createDefaultApproval(partnershipLevel.durationOfApprovalInYears,partnershipLevel.possibleApprovers,partnershipLevel.possibleEndorsers)

        log.debug(partnershipLevel)

        [ partnershipLevel : partnershipLevel, approval: tempApproval ]

    }
    def createInsitutionAndPartnershipFirst(){
        log.debug("creating instution first")
       // long activityTypeId = ActivityType.get(params.activityTypeId)
        ActivityType activityType = ActivityType.get(params.activityTypeId)
        PartnershipLevel partnershipLevel = activityType.requiredLevel
        Approval tempApproval = approvalService.createDefaultApproval(partnershipLevel.durationOfApprovalInYears,partnershipLevel.possibleApprovers,partnershipLevel.possibleEndorsers)


        render (view: 'index', model: [ partnershipLevel : partnershipLevel , activityType : activityType , createNewInstitution : true , instition: new Institution(),approval: tempApproval])
    }
    def createPartnershipFirst(){
        //long activityTypeId = ActivityType.get(params.activityTypeId)
        ActivityType activityType = ActivityType.get(params.activityTypeId)
        PartnershipLevel partnershipLevel = activityType.requiredLevel


        Institution institution = Institution.get(params.institutionId)
        //log.debug("institution: "+institution)
        Approval tempApproval = approvalService.createDefaultApproval(partnershipLevel.durationOfApprovalInYears,partnershipLevel.possibleApprovers,partnershipLevel.possibleEndorsers)


        render  (view: 'index', model: [ partnershipLevel : partnershipLevel , activityType : activityType , createNewIntitute : false,institution : institution,approval: tempApproval])


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
        // TODO get this from the params
        ActivityType activityType = ActivityType.get(params.activityTypeId)
        log.debug("activityType :"+ activityType.id)



        def partnershipLevel = PartnershipLevel.get(params.partnershipLevelId)
        def data = JSON.parse(params.sendData)
        def approvalJSON =data.approval
        def parnershipJSON = data.partnership
        def criteriaDataJSON = data.criteriaData

        Institution institution1 = institutionService.createInstitutionFromJSON(data.institution)
        Approval approval = approvalService.createApprovalFromJSON(approvalJSON)

        Partnership partnership = partnershipService.createPartnership(approval,institution1,partnershipLevel,parnershipJSON , criteriaDataJSON)


        redirect(controller: "cfCreateActivityRequest", action: "createActivityCh", params: [partnershipId: partnership.id, activityTypeId: activityType.id, institution: institution1])
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
