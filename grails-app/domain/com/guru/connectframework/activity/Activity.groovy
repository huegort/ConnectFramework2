package com.guru.connectframework.activity

import com.guru.connectframework.User
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaDataContainer
import com.guru.connectframework.institution.Contact
import com.guru.connectframework.partnership.Partnership

class Activity {

    String name
    String description
    ActivityType activityType
    User owner

    Partnership partnership
    Approval approval
    Contact contact

    CriteriaDataContainer dataContainer

    String notes

    static constraints = {
        description nullable: true
        contact nullable: true
        notes nullable: true
    }
}
