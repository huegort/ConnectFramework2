package com.guru.connectframework.criteriatype.datahandler

import com.guru.connectframework.criteria.Criteria
import com.guru.connectframework.criteria.CriteriaData
import com.guru.connectframework.criteriatype.CriteriaDataHandler
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement

/**
 * Created by andrewbeatty on 07/07/15.
 */
class DateDataHandler extends CriteriaDataHandler {
    private static final log = LogFactory.getLog(this)

    @Override
    CriteriaData handleData(Criteria criteria, JSONElement jsonElement) {

        CriteriaData criteriaData = new CriteriaData()

        try {
            int day = Integer.parseInt(jsonElement["data_" + criteria.id+"_day"])
            int month = Integer.parseInt(jsonElement["data_" + criteria.id+"_month"])
            int year =  Integer.parseInt(jsonElement["data_" + criteria.id+"_year"])

            log.debug(""+day+":"+month+":"+year)
            Calendar c = Calendar.getInstance();
            c.set(year, month-1 , day, 0, 0);



            criteriaData.valueDate=c.getTime()
            log.debug("date is "+ criteriaData.valueDate)
        }catch (Exception e){
            e.printStackTrace()
            log.debug("no such criteria")
        }
        return criteriaData
    }

    @Override
    String getDisplayRenderer() {
       return  "/cfcriteriadata/renderers/daterenderer"
    }

    @Override
    String getFormInput() {
        return "/cfcriteriadata/renderers/dateforminput"
    }
}
