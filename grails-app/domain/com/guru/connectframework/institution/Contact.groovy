package com.guru.connectframework.institution

import com.guru.connectframework.CfEntity

class Contact{
    String title
    String firstName
    String lastName
    String roleInInstitution
    String phone
    String email
    Institution institution
    Date dateArchived

    static constraints = {
        title nullable: true
        roleInInstitution nullable: true
        phone nullable: true
        email nullable: true
        dateArchived nullable: true
        institution nullable: true
    }
    String getName(){
        return firstName + " " + lastName
    }
    String toString() {
        return getName()
    }
}
