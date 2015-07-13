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


    Set<Partnership> partnerships

    static hasMany = [partnerships : Partnership]

    // only to make queries quicker
    Partnership currentHighest

    Date dateArchived



    static constraints = {
        description nullable: true
        notes nullable: true
        currentHighest nullable: true
        address1 nullable: true

        address2 nullable: true
        provence nullable: true
        postcode nullable: true
        dateArchived nullable: true

    }
    Set<Partnership> getPartnerships(){
        //TODO look at this this should not be needed
        log.debug("in get partnerships")
        if (this.partnerships==null){
            log.debug("in instution creating the set of partnerships")
            this.partnerships = new HashSet<Partnership>()
        }
        return this.partnerships
    }

    String toString() {
        return name
    }
}
