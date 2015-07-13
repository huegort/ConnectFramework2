package com.guru.connectframework.activity

class ActivityCategory {
    String name
    Date dateArchived



    static constraints = {
        dateArchived nullable: true
    }
    String toString() {
        return name
    }
}
