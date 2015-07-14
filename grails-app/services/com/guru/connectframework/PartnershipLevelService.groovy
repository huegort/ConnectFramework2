package com.guru.connectframework

import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.partnership.PartnershipLevel
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement

@Transactional
class PartnershipLevelService {
    private static final log = LogFactory.getLog(this)

    PartnershipLevel createPartnershipLevel() {
        PartnershipLevel partnershipLevel = new PartnershipLevel()
        partnershipLevel.criteriaContainer = new CriteriaContainer()

        return partnershipLevel


    }

}
