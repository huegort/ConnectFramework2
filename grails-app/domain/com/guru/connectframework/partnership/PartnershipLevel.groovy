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
}
