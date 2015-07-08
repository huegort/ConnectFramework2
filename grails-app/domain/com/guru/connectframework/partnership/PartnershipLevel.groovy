package com.guru.connectframework.partnership

import com.guru.connectframework.criteria.CriteriaContainer

class PartnershipLevel {
    String name
    String description
    String urlToDoc
    CriteriaContainer criteriaContainer
    int level


    static constraints = {
        description nullable: true
        urlToDoc nullable:  true

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
}
