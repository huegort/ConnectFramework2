package com.guru.connectframework.criteria

import org.apache.commons.logging.LogFactory

class CriteriaDataContainer {
    private static final log = LogFactory.getLog(this)


    SortedSet<CriteriaData> setOfCriteriaData



   public  CriteriaDataContainer(){
       //log.debug("in criteria container")
        setOfCriteriaData = new TreeSet<CriteriaData>()
    }

    static hasMany = [setOfCriteriaData : CriteriaData]

    static constraints = {
    }
}
