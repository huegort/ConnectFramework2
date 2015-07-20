package com.guru.connectframework.criteria

import com.guru.connectframework.Document


class CriteriaData implements Comparable<CriteriaData>{
    static belongsTo = [container: CriteriaDataContainer]
    Criteria criteria
    String valueString
    Document valueDocument
    Date valueDate

    Approval approval

    String notes
    Date dateArchived




    static constraints = {
        valueString nullable: true
        valueDocument nullable: true
        valueDate nullable: true
        notes nullable: true
        dateArchived nullable: true

    }
    static mapping = {
        approval fetch: 'join'

    }

    @Override
    int compareTo(CriteriaData o) {
        return this.criteria.sequenceNumber - o.criteria.sequenceNumber
    }
}
