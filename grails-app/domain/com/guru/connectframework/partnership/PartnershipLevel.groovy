package com.guru.connectframework.partnership

import com.guru.connectframework.User
import com.guru.connectframework.criteria.CriteriaContainer

class PartnershipLevel {
    def userService
    String name
    String description
    String urlToDoc
    CriteriaContainer criteriaContainer
    int level
    int durationOfApprovalInYears = 5
    Date dateArchived

    static constraints = {
        description nullable: true
        urlToDoc nullable:  true
        dateArchived nullable: true
    }
    String toString() {
        return name
    }
    def getCriteria(){
        if (criteriaContainer == null){
            criteriaContainer = new CriteriaContainer()
        }
        return criteriaContainer.setOfCriteria
    }
    def getPossibleEndorsers(){
        return userService.getPossibleEndorsersForPartnershipLevel(this)
    }
    def getPossibleApprovers(){
        return userService.getPossibleApproversForPartnershipLevel(this)
     }

}
