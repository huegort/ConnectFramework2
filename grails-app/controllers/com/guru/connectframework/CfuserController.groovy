package com.guru.connectframework
import com.guru.connectframework.activity.Activity
import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.institution.Institution
import com.guru.connectframework.partnership.Partnership
import grails.converters.JSON

class CfuserController {

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

        render institutionMap as JSON
    }

    def getActivitiesRequest = {
        def user = params['user']
        user = 1
        User current = User.findById(user)

        def activities = Activity.findAllByOwner(current)
        def activitiesList = []

        for (int i = 0; i < activities.size(); i++) {
            def currentActivity = activities.get(i)

            if (currentActivity.approval.status == CriteriaStatus.PENDING || currentActivity.approval.status == CriteriaStatus.DECLINED) {
                activitiesList += activities.get(i)
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

        def approval = Approval.findAllByCreatedBy(current)
        List<Approval> approvalList = []
        for (int i = 0; i < approval.size(); i++) {
            def currentApproval = approval.get(i)
            if (currentApproval.status == CriteriaStatus.PENDING || currentApproval.status == CriteriaStatus.DECLINED) {
                approvalList += currentApproval
            }
        }
        //TODO get the request partnerships with the approval
        def partnershipList = []
        for (int i = 0; i < approvalList.size(); i++) {
            partnershipList += Partnership.findAllByApproval(approvalList.get(i))
        }

        render partnershipList as JSON
    }

}
