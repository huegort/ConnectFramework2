package com.guru.connectframework.criteria

import com.guru.connectframework.criteriatype.CriteriaType

class Criteria implements Comparable<Criteria>{
    static belongsTo = [container: CriteriaContainer]
    String name
    CriteriaContainer container
    CriteriaType dataType
    String description
    int sequenceNumber
    String notes

    Date dateArchived


    static constraints = {
        description nullable: true
        notes nullable: true
        dateArchived nullable: true
    }
    String toString() {
        return name
    }

    @Override
    int compareTo(Criteria o) {
        return this.sequenceNumber - o.sequenceNumber
    }
}
