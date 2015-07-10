package com.guru.connectframework.criteriatype

import com.guru.connectframework.Criteria.CriteriaStatus
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.Criteria
import com.guru.connectframework.criteria.CriteriaData
import com.guru.connectframework.criteria.CriteriaDataContainer
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement
import org.grails.datastore.mapping.validation.ValidationException

/**
 * Created by andrewbeatty on 07/07/15.
 */
abstract class CriteriaDataHandler {
    private static final log = LogFactory.getLog(this)
    CriteriaData getCriteriaData(Criteria criteria, JSONElement jsonElement, Approval baseApproval, CriteriaDataContainer criteriaDataContainer){
        CriteriaData criteriaData = handleData(criteria,jsonElement)
        criteriaData.container = criteriaDataContainer
        criteriaData.criteria = criteria
        criteriaData.approval = Approval.fromBase(baseApproval)
        criteriaData.approval.save()

        return criteriaData

    }

   abstract CriteriaData handleData(Criteria criteria, JSONElement jsonElement)
    abstract String getDisplayRenderer()
    abstract String getFormInput()


}