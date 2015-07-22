package com.guru.connectframework.institution

import com.guru.connectframework.CfEntity

class Region extends CfEntity{
    Date dateArchived



    String name

    static constraints = {
        dateArchived nullable: true
    }

    String toString() {
        return name
    }
}
