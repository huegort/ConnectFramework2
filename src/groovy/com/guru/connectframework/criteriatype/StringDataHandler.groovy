package com.guru.connectframework.criteriatype

import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.Criteria
import com.guru.connectframework.criteria.CriteriaData
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement

/**
 * Created by andrewbeatty on 07/07/15.
 */
class StringDataHandler extends CriteriaDataHandler {
    private static final log = LogFactory.getLog(this)

    @Override
    CriteriaData handleData(Criteria criteria, JSONElement jsonElement) {
        log.debug("in string handler2")
        CriteriaData criteriaData = new CriteriaData()

        try {
            criteriaData.valueString=jsonElement["data_" + criteria.id]
        }catch (Exception e){
            log.debug("no such criteria")
        }
        return criteriaData
    }
}
