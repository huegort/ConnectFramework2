package com.guru.connectframework.institution

import com.guru.connectframework.CfEntity

class Country extends CfEntity{
    String name
    Region region
    Date dateArchived

    static constraints = {
        dateArchived nullable: true
    }
    String toString() {
        return name


    }
}
