package com.guru.connectframework.activity

import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.partnership.PartnershipLevel
import com.guru.connectframework.util.Document

class ActivityType {

    String name
    String description
    ActivityCategory category
    PartnershipLevel requiredLevel
    CriteriaContainer criteriaContainer

    String urlToDoc
    Document document

    static constraints = {
        description nullable: true
        urlToDoc nullable: true
        document nullable: true
    }
    String toString() {
        return name
    }
}
