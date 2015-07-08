package com.guru.connectframework

import com.guru.connectframework.activity.Activity
import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.institution.Institution
import com.guru.connectframework.partnership.Partnership
import grails.converters.JSON
import org.apache.commons.logging.LogFactory

class CfuserController {
    private static final log = LogFactory.getLog(this)

    def home() {}

    def show(Activity activityInstance) {
        respond activityInstance
    }

    def institutionsList = {
        def q = params['q']
        def institutionList = Institution.findAllByNameLike("%${q}%")
        render institutionList as JSON
    }

    def getCategories = {
        def categoriesList = ActivityCategory.getAll()
        render categoriesList as JSON
    }

    def getActivityTypes = {
        def activityTypesList = ActivityType.getAll()
        render activityTypesList as JSON
    }

    def getActivities = {

        def q = params['q']

        User current = User.findById(q)
        def activities = Activity.findAllByOwner(current)
        def institutionMap = [:]

        for (int i = 0; i < activities.size(); i++) {
            def currentActivity = activities.get(i)

            if (currentActivity.approval.status == CriteriaStatus.APPROVED) {
                def institution = currentActivity.partnership.institution

                if (institutionMap.get(institution) == null) {

                    institutionMap.put(institution, [])
                }

                //TODO does groovy make a new object each time we add to this set
                // is there any way of passing this set by reference in groovy

                def mySet = institutionMap.get(institution)
                mySet += currentActivity
                institutionMap.put(institution, mySet)
            }
        }

        render institutionMap as JSON
    }

    def getActivitiesRequest = {
        def user = params['user']
        user = 1
        User current = User.findById(user)
        def pending = CriteriaStatus.PENDING
        def declined = CriteriaStatus.DECLINED

        def activities = Activity.findAllByOwner(current)
        def activitiesList = []

        for (int i = 0; i < activities.size(); i++) {
            def currentActivity = activities.get(i)

            if (currentActivity.approval.status == pending || currentActivity.approval.status == declined) {
                activitiesList += currentActivity
            }

        }

        render activitiesList as JSON

    }

    def getPartnershipRequest = {
        def user = params['user']
        user = 1
        User current = User.findById(user)
        def pending = CriteriaStatus.PENDING
        def declined = CriteriaStatus.DECLINED

        def partnerships = Partnership.findAllByOwner(current)
        def partnershipList = []

        for (int i = 0; i < partnerships.size(); i++) {
            def currentPartnership = partnerships.get(i)
            if (currentPartnership.approval.status == pending || currentPartnership.approval.status == declined){
                partnershipList += currentPartnership
            }

        }

        render partnershipList as JSON
    }
    def createActivityRequest(){
        // there are three states this can come in
        // 0. activityType and or intitution now selected -> error back to page
        // 1. request to create new Institution -> create institution
        // 2. the current one is not approved at this level -> deepen current institution
        // 3. intitution exist and is approved -> go straight to create activity
        log.debug(params)

        log.debug("in createActivityRequest")
        redirect (controller: 'CreatePartnershipRequest', action: 'test')

    }

}
