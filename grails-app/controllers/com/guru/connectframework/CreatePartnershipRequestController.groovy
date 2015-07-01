package com.guru.connectframework

import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.partnership.PartnershipLevel
import org.apache.commons.logging.LogFactory

class CreatePartnershipRequestController {
    private static final log = LogFactory.getLog(this)

    def index() {
        //log.debug(params.partnershipLevel.id)
        def partnershipLevel = PartnershipLevel.get(params.partnershipLevel.id)
        //def activityType = new ActivityType(params.activityType.ie)
        System.out.println(partnershipLevel)
        log.debug(partnershipLevel)

        [ partnershipLevel : partnershipLevel ]

    }
}
