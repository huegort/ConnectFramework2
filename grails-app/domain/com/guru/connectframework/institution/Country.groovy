package com.guru.connectframework.institution

class Country {
    String name
    Region region
    Date dateArchived

    static constraints = {
    }
    String toString() {
        return name
        dateArchived nullable: true

    }
}
