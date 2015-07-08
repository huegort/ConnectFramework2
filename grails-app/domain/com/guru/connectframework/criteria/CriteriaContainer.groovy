package com.guru.connectframework.criteria



class CriteriaContainer {
    SortedSet<Criteria> setOfCriteria

    static hasMany = [setOfCriteria : Criteria]

    public CriteriaContainer(){
        setOfCriteria = new TreeSet<Criteria>()
    }

    static constraints = {
    }
}
