package com.guru.connectframework

import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.partnership.PartnershipLevel
import grails.transaction.Transactional

@Transactional
class ActivityTypeService {

    ActivityType createActivityTypeFromParams(def params) {
        // TODO assign sub objects by id directly (with out retrieving them from the DB)
        ActivityType activityType = new ActivityType(params)
        def categoryId = Integer.parseInt(params.categoryId)
        activityType.category = ActivityCategory.get(categoryId)
        def partnershipLevelId = Integer.parseInt(params.partnershipLevelId)
        activityType.requiredLevel = PartnershipLevel.get(partnershipLevelId)
        try{
            //def documentId = Integer.parseInt(params.documentId)
            //activityType.document = Document.get(documentId)

        }catch(NumberFormatException nfe){
            log.info("activity type ("+activityType+") created without a document (we got a number format exception on "+params.documentId+")")
        }
        return activityType

    }
}
