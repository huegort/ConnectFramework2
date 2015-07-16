package com.guru.connectframework

import com.guru.connectframework.activity.Activity
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaDataContainer
import com.guru.connectframework.institution.Contact
import com.guru.connectframework.partnership.Partnership
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement
import org.grails.datastore.mapping.validation.ValidationException

@Transactional
class ActivityService {
    private static final log = LogFactory.getLog(this)
    def approvalService
    def userService

    // I am creating a dumby activity for the form
    Activity createDefaultActivity(ActivityType activityType, Partnership partnership) {
        Activity activity = new Activity()
        log.debug("activity : "+ activity)
        log.debug("activity type: "+ activityType)
        log.debug("activity class: "+ activityType.class.name)
        log.debug("activity type: "+ activityType.name)
        log.debug("partnership " + partnership)
        log.debug("activity approvers: "+ activityType.possibleApprovers)
        log.debug("service: "+ approvalService)


        activity.approval = approvalService.createDefaultApproval(activityType.durationOfApprovalInYears, activityType.possibleApprovers, activityType.possibleEndorsers)

        //activity.dataContainer = new CriteriaDataContainer()
        activity.activityType = activityType
        // TODO get this from the logged in user
        activity.owner = userService.currentUser
        activity.partnership = partnership
        activity.contact = partnership.contact
        activity.name = activityType.name

        return activity

    }
    Activity createActivityFromJSON(JSONElement activityJSON, Approval approval,JSONElement criteriaDataJSON, ActivityType activityType,Partnership partnership){
        Activity activity = new Activity(activityJSON)
        activity.owner = userService.currentUser
        activity.partnership = partnership
        activity.activityType = activityType
        activity.approval = approval

        // TODO we need to discuss contacts
        if (activity.contact == null) {
            activity.contact = Contact.get(1)
        }


        activity.dataContainer = new CriteriaDataContainer()

        activityType.criteria.each {criteria ->
            activity.dataContainer.setOfCriteriaData.add( criteria.dataType.getData(criteria,criteriaDataJSON, activity.approval, activity.dataContainer))
        }

        return saveActivity(activity)

    }
    Activity saveActivity(Activity activity){
        try {
            activity.approval.save()
           // activity.contact.save()
            activity.dataContainer.save()
            activity.save(flush: true, failOnError: true)
        }catch (ValidationException e) {
            e.printStackTrace()
        }
        log.debug("activity Saved")
        return activity


    }
}
