package com.guru.connectframework.institution

class Contact {
    String name
    String phone
    String email
    Institution institution
    static constraints = {
        phone nullable: true
        email nullable: true

    }
}
