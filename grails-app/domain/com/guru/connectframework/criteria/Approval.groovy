package com.guru.connectframework.criteria

import com.guru.connectframework.CriteriaStatus
import com.guru.connectframework.User

class Approval {
    User createdBy

    User endorser
    Date dateEndorsed

    User approver
    Date created
    Date dateApproved
    Date validTo
    CriteriaStatus status

    String notes

    static constraints = {
        notes nullable: true
    }
}
