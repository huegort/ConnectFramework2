package com.guru.connectframework

import com.guru.connectframework.activity.Activity
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.institution.Institution
import com.guru.connectframework.partnership.Partnership
import com.guru.connectframework.partnership.PartnershipLevel
import grails.converters.JSON
import org.apache.commons.logging.LogFactory

class CreateActivityRequestController {
    private static final log = LogFactory.getLog(this)
    def activityService
    def approvalService

   def createActivityCh(){
       //log.debug("chainModel:" + chainModel)
       ActivityType activityType = ActivityType.get(params.activityTypeId)
       Partnership partnership = Partnership.get(params.partnershipId)
       //log.debug("activity type 1: "+ activityType)
       //log.debug("partnership 1" + partnership)
       Activity activity = activityService.createDefaultActivity(activityType, partnership)
       render (view: "index" , model: [partnership: partnership, activityType: activityType, activity: activity])
  }


    def index(Activity activity) {
        log.debug("**** index is being used !!!!!!!!!!*********")
        render (view: "index" , model: [activity: activity])

    }
    def blah(){
        log.debug("yo")
        render (view: "index" , model: [activity: activity])
    }

    def saveActivity() {
        log.debug("in save activity")
        ActivityType activityType = ActivityType.get(params.activityTypeId)

        def partnership = Partnership.get(params.partnershipId)

        def data = JSON.parse(params.sendData)
        def approvalJSON =data.approval
        def activityJSON = data.activity
        def criteriaDataJSON = data.criteriaData

        Approval approval = approvalService.createApprovalFromJSON(approvalJSON)

        Activity activity = activityService.createActivityFromJSON(activityJSON, approval, criteriaDataJSON, activityType,partnership)

         if (activity.hasErrors()) {
            log.debug("activity has errors")
             render (view: "index" , model: [partnership: partnership, activityType: activityType, activity: activity])
        }

        log.debug("activity saved and returning to cf user home")
        redirect (controller: "Cfuser", action: "home")


    }
}
