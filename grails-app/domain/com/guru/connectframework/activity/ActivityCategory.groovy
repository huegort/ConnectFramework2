package com.guru.connectframework.activity

import com.guru.connectframework.CfEntity

class ActivityCategory{
    String name

    Date dateArchived

    static hasMany = [activityTypes : ActivityType]

    static constraints = {
        dateArchived nullable: true
    }
    String toString() {
        return name
    }
}
