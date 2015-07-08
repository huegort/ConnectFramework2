package com.guru.connectframework

import com.guru.connectframework.partnership.Partnership
import grails.converters.JSON
import org.apache.commons.logging.LogFactory

class CfapproverController {
    private static final log = LogFactory.getLog(this)

    def home() { }

    def getInstitutions = {
        def user = params['q']
        user = ''

        long mynum = 2

        def c = Partnership.createCriteria()
        def results = c.list {
            approval {
                and {
                    approver {
                        eq("id", mynum)
                    }
                    //isNull('dateEndorsed')
                }
            }
        }

        log.debug(results.toString())
        Partnership partnership

        render results as JSON
    }

    def getActivities = {

    }


}
