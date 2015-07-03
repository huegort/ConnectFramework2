package com.guru.connectframework.institution

class Institution {
    String name
    String description
    String address1
    String address2
    String provence
    String postcode
    Country country
    String notes
    static constraints = {
        description nullable: true
        notes nullable: true
        address2 nullable: true
    }
    String toString() {
        return name
    }
}
