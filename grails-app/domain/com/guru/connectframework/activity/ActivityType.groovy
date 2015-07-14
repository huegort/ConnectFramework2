package com.guru.connectframework.activity

import com.guru.connectframework.Document
import com.guru.connectframework.Role
import com.guru.connectframework.User
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.partnership.PartnershipLevel


class ActivityType {
    def userService

    String name
    String description
    ActivityCategory category
    PartnershipLevel requiredLevel
    CriteriaContainer criteriaContainer

    int defaultDurationInYears = 5

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
    def getPossibleEndorsers(){
        return userService.getPossibleEndorsersForActivityType(this)

    }
    def getPossibleApprovers(){
        return userService.getPossibleApproversForActivityType(this)

    }
}
