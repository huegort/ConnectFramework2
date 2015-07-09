package com.guru.connectframework

import com.guru.connectframework.Criteria.CriteriaStatus
import com.guru.connectframework.criteria.Approval
import grails.transaction.Transactional
import groovy.time.TimeCategory
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement

@Transactional
class ApprovalService {
    private static final log = LogFactory.getLog(this)
    def userService

    Approval createApprovalFromJSON(JSONElement approvalJSON) {
        //log.debug("in approval Service****: "+ approvalJSON)
        log.debug("approver Id: " + approvalJSON.approverId)

        Approval approval = new Approval(approvalJSON)

        if (approval.createdBy == null){

            approval.createdBy = userService.currentUser
            approval.created = new Date()
        }

        if (approval.status == null){
            approval.status = CriteriaStatus.PENDING
        }
        // I had trouble loading these automativally from JSON
        if (approval.approver == null) {
            int approverId = Integer.parseInt(approvalJSON.approverId)
            approval.approver = User.get(approverId)
        }
        if (approval.endorser == null) {
            int endorserId = Integer.parseInt(approvalJSON.endorserId)
            approval.endorser = User.get(endorserId)
        }
        log.debug("after create: "+ approval.approver)

        return approval


    }
    Approval createDefaultApproval(int duration, Set<User> possibleApprovers,Set<User> possibleEndorsers){
        User self = userService.currentUser
        User headOfSchool = userService.headOfSchool
        User headOfFaculty = userService.headOfFaculty
        Approval approval = new Approval()
        approval.createdBy = self
        approval.created = new Date()
        approval.status = CriteriaStatus.PENDING
        use (TimeCategory) {
            approval.validTo = duration.years.from.now
        }


        // TODO we need to think about this
        if (headOfSchool != null)(
            approval.endorser = headOfSchool
        )else{
            approval.endorser = self
        }
        if (headOfFaculty != null && headOfFaculty in possibleApprovers){
            approval.approver = headOfFaculty

        }else{
            approval.approver =  userService.universityRepresentative
        }

        return approval

    }

}
