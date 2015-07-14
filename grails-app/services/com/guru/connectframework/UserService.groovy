package com.guru.connectframework

import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.partnership.PartnershipLevel
import grails.transaction.Transactional

@Transactional
class UserService {

    // TODO use spring security framework to get this
    User getCurrentUser() {
        return User.get(1)
    }
    User getHeadOfSchool(){
        return User.get(3)
    }
    User getHeadOfFaculty() {
        return User.get(2)

    }
    User getUniversityRepresentative(){
        return User.get(1)
    }

    //Luis Test Users
    User getApprover() {
        //TODO this will not be used once we integrate with Guru
        return User.get(2)
    }
    User getEndorser() {
        //TODO this will not be used once we integrate with Guru

        return User.get(3)
    }
    User getUser() {
        return User.get(1)
    }
    // will use roles
    def getPossibleEndorsersForPartnershipLevel(PartnershipLevel partnershipLevel) {
        Set<User> endorsers = new HashSet<User>()
        endorsers.add(User.get(3))
        endorsers.add(User.get(2))
        return endorsers
    }
    def getPossibleApproversForPartnershipLevel(PartnershipLevel partnershipLevel) {
        //TODO get this from the roles for this partnership level
        Set<User> approvers = new HashSet<User>()
        approvers.add(User.get(3))
        approvers.add(User.get(2))
        return approvers
    }
    def getPossibleEndorsersForActivityType(ActivityType activityType){
        Set<User> endorsers = new HashSet<User>()
        endorsers.add(User.get(3))
        endorsers.add(User.get(2))
        return endorsers
    }
    def getPossibleApproversForActivityType(ActivityType activityType) {
        //TODO get this from the roles for this activity Type
        Set<User> approvers = new HashSet<User>()
        approvers.add(User.get(3))
        approvers.add(User.get(2))
        return approvers
    }
}
