package com.guru.connectframework.partnership

import com.guru.connectframework.User
import com.guru.connectframework.criteria.CriteriaContainer

class PartnershipLevel {
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
        //TODO get this from the roles for this partnership level
        Set<User> endorsers = new HashSet<User>()
        endorsers.add(User.get(1))
        endorsers.add(User.get(2))
        return endorsers

    }
    def getPossibleApprovers(){
        //TODO get this from the roles for this partnership level
        Set<User> approvers = new HashSet<User>()
        approvers.add(User.get(1))
        approvers.add(User.get(2))
        return approvers

    }
}
