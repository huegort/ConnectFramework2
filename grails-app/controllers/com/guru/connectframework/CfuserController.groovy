package com.guru.connectframework
import com.guru.connectframework.activity.Activity
import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.institution.Institution
import grails.converters.JSON

class CfuserController {

    def home() {

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

    def getActivitiesOForUser = {
        //def userId = params['user']
        def userId = 1
        def currentUser = User.findById(userId)
        def activityUserList = Activity.findAllByOwner(currentUser)
        render activityUserList as JSON

    }

    def getUserActivities = {

        def q = params['q']

        User current = User.findById(q)
        def activities = Activity.findAllByOwner(current)
        def institutionMap = [:]



        for (int i = 0; i < activities.size(); i++) {
            def currentActivity = activities.get(i)

            def institution =currentActivity.partnership.institution

            if (institutionMap.get(institution)== null){

                institutionMap.put(institution, [])
            }

            //TODO does groovy make a new object each time we add to this set
            // is there any way of passing this set by reference in groovy

            def mySet = institutionMap.get(institution)
            mySet +=currentActivity
            institutionMap.put(institution, mySet)
        }

        render institutionMap as JSON
    }

}
