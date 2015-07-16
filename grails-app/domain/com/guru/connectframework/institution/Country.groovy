package com.guru.connectframework.institution

class Country {
    String name
    Region region
    Date dateArchived

    static constraints = {
        dateArchived nullable: true
    }
    String toString() {
        return name


    }
}
