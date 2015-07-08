package com.guru.connectframework

import com.guru.connectframework.Criteria.CriteriaStatus
import com.guru.connectframework.criteria.Approval
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement

@Transactional
class ApprovalService {
    private static final log = LogFactory.getLog(this)

    Approval createApprovalFromJSON(JSONElement approvalJSON) {
        //log.debug("in approval Service****: "+ approvalJSON)
        log.debug("approver Id: " + approvalJSON.approverId)

        Approval approval = new Approval(approvalJSON)

        if (approval.createdBy == null){
            //TODO get from security
            approval.createdBy = User.get(1)
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
}
