package com.guru.connectframework.activity

import com.guru.connectframework.User
import com.guru.connectframework.CriteriaStatus


class ActivityCriteriaData {
    static belongsTo = [activity: Activity]

    ActivityCriteria associatedCriteria

    CriteriaStatus status
    Date dataApproved
    User approvedBy

    Date validUntil

    String stringData
    Date   dateData
    //File fileData

    Date created

    static constraints = {
    }
}
