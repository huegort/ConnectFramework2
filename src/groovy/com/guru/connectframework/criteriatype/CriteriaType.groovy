/**
 * Created by andrewbeatty on 23/06/15.
 */
package com.guru.connectframework.criteriatype

import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.Criteria
import com.guru.connectframework.criteria.CriteriaData
import com.guru.connectframework.criteria.CriteriaDataContainer
import com.guru.connectframework.criteriatype.datahandler.DateDataHandler
import com.guru.connectframework.criteriatype.datahandler.FileDataHandler
import com.guru.connectframework.criteriatype.datahandler.StringDataHandler
import org.codehaus.groovy.grails.web.json.JSONElement

public enum CriteriaType{
    STRING (new StringDataHandler()),
    FILE (new FileDataHandler()),
    DATE (new DateDataHandler())

    CriteriaDataHandler criteriaDataHandler

    CriteriaType(CriteriaDataHandler criteriaDataHandler){
        this.criteriaDataHandler = criteriaDataHandler

    }

    CriteriaData getData(Criteria criteria, JSONElement jsonElement, Approval baseApproval, CriteriaDataContainer container){
        return this.criteriaDataHandler.getCriteriaData(criteria,jsonElement, baseApproval, container)
    }
    String getDisplayRenderer(){
        this.criteriaDataHandler.displayRenderer
    }
    String getFormInput(){
        this.criteriaDataHandler.formInput
    }

}
