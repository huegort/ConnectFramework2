package com.guru.connectframework.institution

import com.guru.connectframework.CfEntity

class Region{
    Date dateArchived

    String name

    static constraints = {
        dateArchived nullable: true
    }

    String toString() {
        return name
    }
}
