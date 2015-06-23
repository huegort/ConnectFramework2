package com.guru.connectframework.activity

import com.guru.connectframework.partnership.PartnershipLevel

class ActivityType {

    String name
    ActivityCategory category
    String explainationURL
    String descritption
    PartnershipLevel levelRequired

    static hasMany = [criteria: ActivityCriteria]



    static constraints = {
    }
}
