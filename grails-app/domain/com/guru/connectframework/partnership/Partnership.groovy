package com.guru.connectframework.partnership

import com.guru.connectframework.User
import com.guru.connectframework.activity.Activity
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaDataContainer
import com.guru.connectframework.institution.Contact
import com.guru.connectframework.institution.Institution

class Partnership {
    String name

    User owner
    Institution institution
    PartnershipLevel partnershipLevel

    Approval approval
    Contact contact

    CriteriaDataContainer dataContainer


    def getCriteriaData(){
        return dataContainer.setOfCriteriaData
    }


    static hasMany = [activities : Activity]

    static constraints = {
        contact nullable: true


    }
    String toString() {
        return name
    }
}
