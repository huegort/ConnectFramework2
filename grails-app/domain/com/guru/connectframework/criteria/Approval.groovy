package com.guru.connectframework.criteria

import com.guru.connectframework.CfEntity
import com.guru.connectframework.Criteria.CriteriaStatus
import com.guru.connectframework.User

class Approval{
    User createdBy
    Date created

    User endorser
    Date dateEndorsed

    User approver
    Date dateApproved
    Date validTo

    CriteriaStatus status

    Date dateArchived

    String feedback

    public Approval(){
    }


    static Approval fromBase(Approval baseApproval){
        Approval approval = new Approval()
        approval = new Approval()
        approval.approver = baseApproval.approver
        approval.endorser = baseApproval.endorser
        approval.createdBy = baseApproval.createdBy
        approval.created = new Date()
        approval.status = CriteriaStatus.PENDING
        return approval
    }

    public boolean isEndorsed(){
        return (dateEndorsed != null)
    }
    static constraints = {
        feedback nullable: true
        dateArchived nullable: true
        dateApproved nullable: true
        dateEndorsed nullable: true
        validTo nullable: true
    }


}
