package com.guru.connectframework.activity

import com.guru.connectframework.CriteriaType

class ActivityCriteria {

    String name
    CriteriaType type
    int sequenceNumber

    static belongsTo = [activityType: ActivityType]


    static constraints = {
    }
}
