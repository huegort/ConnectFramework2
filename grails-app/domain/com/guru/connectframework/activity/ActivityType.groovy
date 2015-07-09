package com.guru.connectframework.activity

import com.guru.connectframework.Document
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.partnership.PartnershipLevel


class ActivityType {

    String name
    String description
    ActivityCategory category
    PartnershipLevel requiredLevel
    CriteriaContainer criteriaContainer

    String urlToDoc
    Document document

    def getCriteria(){
        if (criteriaContainer == null){
            criteriaContainer = new CriteriaContainer()
        }
        return criteriaContainer.setOfCriteria
    }

    static constraints = {
        description nullable: true
        urlToDoc nullable: true
        document nullable: true
    }
    String toString() {
        return name
    }
}
