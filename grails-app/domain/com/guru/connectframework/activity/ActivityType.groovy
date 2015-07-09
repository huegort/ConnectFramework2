package com.guru.connectframework.activity

import com.guru.connectframework.Document
import com.guru.connectframework.Role
import com.guru.connectframework.User
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.partnership.PartnershipLevel


class ActivityType {

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
