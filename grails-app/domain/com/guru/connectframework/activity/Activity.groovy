package com.guru.connectframework.activity

import com.guru.connectframework.CfEntity
import com.guru.connectframework.Document
import com.guru.connectframework.User
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaDataContainer
import com.guru.connectframework.institution.Contact
import com.guru.connectframework.partnership.Partnership



class Activity{

    String name
    String description
    ActivityType activityType
    User owner

    Partnership partnership
    Approval approval
    Contact contact

    CriteriaDataContainer dataContainer

    Date dateArchived

   

    Document agreementTemplate
    Document finalAgreement

    def getCriteriaData(){
        return dataContainer.setOfCriteriaData
    }

    static constraints = {
        description nullable: true
        contact nullable: true
        agreementTemplate nullable: true
        finalAgreement nullable: true
        dateArchived nullable: true

    }
    static mapping = {
        approval fetch: 'join'

    }
    String toString() {
        return name
    }
}
