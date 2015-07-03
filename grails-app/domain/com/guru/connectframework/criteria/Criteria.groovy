package com.guru.connectframework.criteria

import com.guru.connectframework.CriteriaType

class Criteria {
    static belongsTo = [container: CriteriaContainer]
    String name
    CriteriaContainer container
    CriteriaType dataType
    String description
    int sequenceNumber
    String notes

    static constraints = {
        description nullable: true
        notes nullable: true
    }
    String toString() {
        return name
    }
}
