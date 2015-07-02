package com.guru.connectframework

import com.guru.connectframework.institution.Institution
import grails.converters.JSON

class CfuserController {

    def home() {

    }

    def institutionsList = {
        def q = params['q']

        def institutionList = Institution.findAllByNameLike("%${q}%")

        render institutionList as JSON
    }

}
