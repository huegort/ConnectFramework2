package com.guru.connectframework.criteria

import com.guru.connectframework.util.Document


class CriteriaData {
    static belongsTo = [container: CriteriaDataContainer]
    Criteria criteria
    String valueString
    Document valueDocument
    Date valueDate

    Approval approval


    static constraints = {
        valueString nullable: true
        valueDocument nullable: true
        valueDate nullable: true
    }
}