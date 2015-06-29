package com.guru.connectframework.partnership

import com.guru.connectframework.Activity.Activity
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaDataContainer
import com.guru.connectframework.institution.Contact
import com.guru.connectframework.institution.Institution

class Partnership {
    String name
    Institution institution
    PartnershipLevel partnershipLevel

    Approval approval
    Contact contact

    CriteriaDataContainer dataContainer
    String notes

    static hasMany = [activities : Activity]



    static constraints = {
        contact nullable: true
        notes nullable: true
    }
}
