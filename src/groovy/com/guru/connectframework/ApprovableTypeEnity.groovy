package com.guru.connectframework

/**
 * Created by andrewbeatty on 22/07/15.
 */
class ApprovableTypeEnity extends CfEntity{
    Role creatorRole
    Role endorserRole
    Role approverRole

    static constraints = {
        creatorRole nullable: true
        endorserRole nullable:  true
        approverRole nullable: true
    }
}
