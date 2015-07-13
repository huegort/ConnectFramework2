package com.guru.connectframework

import com.guru.connectframework.Criteria.CriteriaStatus
import com.guru.connectframework.activity.Activity
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaData
import com.guru.connectframework.partnership.Partnership
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory

class CfProcessApprovalController {
    private static final log = LogFactory.getLog(this)

    def approvePartnership() {
        Partnership partnership = Partnership.get(params.partnershipId)

        SortedSet<CriteriaData> setOfcriteriaData = partnership.criteriaData

        render  (view :"approvepartnership", model: [ partnership : partnership , setOfCriteriaData: setOfcriteriaData,succesStatus: CriteriaStatus.APPROVED])

    }
    def approveActivity(){
        Activity activity = Activity.get(params.activityId)

        SortedSet<CriteriaData> setOfcriteriaData = activity.criteriaData

        render  (view :"approveactivity", model: [ activity : activity , setOfCriteriaData: setOfcriteriaData,succesStatus: CriteriaStatus.APPROVED])


    }
    def endorsePartnership(){
        Partnership partnership = Partnership.get(params.partnershipId)

        SortedSet<CriteriaData> setOfcriteriaData = partnership.criteriaData

        render  (view :"endorsepartnership", model: [ partnership : partnership , setOfCriteriaData: setOfcriteriaData,succesStatus: CriteriaStatus.ENDORSED])
    }
    def endorseActivity(){
        Activity activity = Activity.get(params.activityId)

        SortedSet<CriteriaData> setOfcriteriaData = activity.criteriaData

        render  (view :"endorseactivity", model: [ activity : activity , setOfCriteriaData: setOfcriteriaData,succesStatus: CriteriaStatus.ENDORSED])


    }

    @Transactional
    def changeCriteriaDataStatus(){
        log.debug("in approve criteria status")

        CriteriaData criteriaData = CriteriaData.get(params.criteriaDataId)
        String criteriaStatusID = params.newCriteriaStatus

        CriteriaStatus newCriteriaStatus = criteriaStatusID as CriteriaStatus
        Approval approval =criteriaData.approval


        criteriaData.approval = changeApprovalStatus(approval,newCriteriaStatus)

        criteriaData.save(flush: true, failOnError: true)
        log.debug("the status is:"+criteriaData.approval.status.display)

        render  (view :"_criteriadataitem", model: [ criteriaData : criteriaData])

    }
    @Transactional
    def changePartnershipStatus(){
        log.debug("in approve criteria status")
        //TODO Security

        Partnership partnership = Partnership.get(params.entityId)
        String criteriaStatusID = params.newCriteriaStatus

        CriteriaStatus newCriteriaStatus = criteriaStatusID as CriteriaStatus
        Approval approval =partnership.approval


        partnership.approval = changeApprovalStatus(approval,newCriteriaStatus)

        partnership.save(flush: true, failOnError: true)
        log.debug("the status is:"+partnership.approval.status.display)

        render  (view :"_partnershipdisplay", model: [ partnership : partnership])


    }
    @Transactional
    def changeActivityStatus(){
        log.debug("in approve actitity status")
        //TODO Security

        Activity activity = Activity.get(params.entityId)

        String criteriaStatusID = params.newCriteriaStatus
        CriteriaStatus newCriteriaStatus = criteriaStatusID as CriteriaStatus
        Approval approval =activity.approval


        activity.approval = changeApprovalStatus(approval,newCriteriaStatus)

        activity.save(flush: true, failOnError: true)
        //log.debug("the status is:"+activity.approval.status.display)

        render  (view :"_activitydisplay", model: [ activity : activity])

    }


    Approval changeApprovalStatus(Approval approval, CriteriaStatus newCriteriaStatus){

        //log.debug("change status to "+newCriteriaStatus.display)
        // TODO check roles
        if (approval.status != newCriteriaStatus ){
            if (newCriteriaStatus == CriteriaStatus.ENDORSED){
                approval.dateEndorsed = new Date()
                if (approval.status != CriteriaStatus.APPROVED){
                    approval.status = CriteriaStatus.ENDORSED
                }
            }else{
                if (newCriteriaStatus == CriteriaStatus.APPROVED){
                approval.dateApproved = new Date()
                approval.status = newCriteriaStatus
             }else{
                approval.status = newCriteriaStatus}
            }
            approval.save(flush: true, failOnError: true)

        }
       return approval


    }
    def test(){
        log.debug("test worked")
        render("yo mamma");
    }
}
