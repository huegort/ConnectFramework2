package com.guru.connectframework.institution

class Region {
    Date dateArchived



    String name

    static constraints = {
        dateArchived nullable: true
    }

    String toString() {
        return name
    }
}
