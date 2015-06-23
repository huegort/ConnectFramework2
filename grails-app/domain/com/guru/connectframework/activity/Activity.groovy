package com.guru.connectframework.activity
import com.guru.connectframework.CriteriaStatus
import com.guru.connectframework.User
import com.guru.connectframework.institution.Institution


class Activity {

    ActivityType type
    Institution institution
    User owner
    CriteriaStatus status

    User approver
    Date dateApproved
    Date validUntil

    Date created

    static hasMany = [criteriaData: ActivityCriteriaData]
    static constraints = {
    }
}
