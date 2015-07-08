package com.guru.connectframework.institution

import com.guru.connectframework.partnership.Partnership

class Institution {
    String name
    String description
    String address1
    String address2
    String provence
    String postcode
    Country country
    String notes

    Partnership currentHighest

    static constraints = {
        description nullable: true
        notes nullable: true
        currentHighest nullable: true
        address1 nullable: true

        address2 nullable: true
        provence nullable: true
        postcode nullable: true

    }
    String toString() {
        return name
    }
}
