package com.guru.connectframework.institution

class Contact {
    String title
    String firstName
    String lastName
    String roleInInstitution
    String phone
    String email
    Institution institution
    static constraints = {
        title nullable: true
        roleInInstitution nullable: true
        phone nullable: true
        email nullable: true

    }
    String toString() {
        return getName()
    }
    String getName(){
        return firstName + " " + lastName
    }
}
