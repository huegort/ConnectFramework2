package com.guru.connectframework

import com.guru.connectframework.criteria.Criteria
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.criteriatype.CriteriaType
import com.guru.connectframework.partnership.PartnershipLevel
import org.apache.commons.logging.LogFactory

class CfadminController {
    private static final log = LogFactory.getLog(this)

    def home() {
        def partnershipLevels = PartnershipLevel.getAll()




        [partnershipLevels : partnershipLevels]
    }

    def createLevel() {
        log.debug(params.toString())
        PartnershipLevel partnershipLevel = new PartnershipLevel()
        CriteriaContainer criteriaContainer = new CriteriaContainer()
        SortedSet<Criteria> criteriasLevel = []



        params.criteriaContainer.each { criterias ->
            Criteria criteria = new Criteria()
            criteria.setName(criterias.name)
            criteria.setDataType(criterias.type as CriteriaType)

            criteriasLevel.add(criteria)
        }

        log.debug(criteriasLevel.toString())

    }
}
