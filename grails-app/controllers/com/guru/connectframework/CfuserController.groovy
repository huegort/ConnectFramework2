package com.guru.connectframework

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

}
