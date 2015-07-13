package com.guru.connectframework

import grails.transaction.Transactional

@Transactional
class UserService {

    // TODO use spring security framework to get this
    User getCurrentUser() {
        return User.get(1)
    }
    User getHeadOfSchool(){
        return User.get(1)
    }
    User getHeadOfFaculty() {
        return User.get(1)

    }
    User getUniversityRepresentative(){
        return User.get(1)
    }

    //Luis Test Users
    User getApprover() {
        return User.get(2)
    }
    User getEndorser() {
        return User.get(3)
    }
    User getUser() {
        return User.get(1)
    }
}
