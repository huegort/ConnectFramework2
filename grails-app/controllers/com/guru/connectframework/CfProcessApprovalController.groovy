package com.guru.connectframework

import com.guru.connectframework.Criteria.CriteriaStatus
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

        render  (view :"approvepartnership", model: [ partnership : partnership , setOfCriteriaData: setOfcriteriaData])

    }
    def approveActivity(){

    }
    def endorsePartnership(){
        Partnership partnership = Partnership.get(params.partnershipId)

        SortedSet<CriteriaData> setOfcriteriaData = partnership.criteriaData

        render  (view :"endorsepartnership", model: [ partnership : partnership , setOfCriteriaData: setOfcriteriaData])
    }
    def endorseActivity(){

    }

    @Transactional
    def changeApprovalStatus(){
        log.debug("in approve status2")

        CriteriaData criteriaData = CriteriaData.get(params.criteriaDataId)
        String criteriaStatusID = params.newCriteriaStatus

        CriteriaStatus newCriteriaStatus = criteriaStatusID as CriteriaStatus
        Approval approval =criteriaData.approval
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
            criteriaData.approval = approval
            approval.save(flush: true, failOnError: true)
            criteriaData.save(flush: true, failOnError: true)
            log.debug("the status is:"+criteriaData.approval.status.display)
        }
        render  (view :"_criteriadataitem", model: [ criteriaData : criteriaData])


    }
    def test(){
        log.debug("test worked")
        render("yo mamma");
    }
}
