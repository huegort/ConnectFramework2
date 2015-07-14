package com.guru.connectframework

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

    }
}
