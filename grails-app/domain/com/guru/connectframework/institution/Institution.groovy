package com.guru.connectframework.institution

class Institution {
    String name
    String description
    Country country
    String notes
    static constraints = {
        description nullable: true
        notes nullable: true
    }
}
