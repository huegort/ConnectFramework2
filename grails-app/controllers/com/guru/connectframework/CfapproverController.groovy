package com.guru.connectframework

import com.guru.connectframework.activity.Activity
import com.guru.connectframework.partnership.Partnership
import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory

@Transactional(readOnly = true)
class CfapproverController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    private static final log = LogFactory.getLog(this)

    def approverHome() {
        long tempUser = 3
        //Gets the list of Institutions Approver
        def criteriaPartnership = Partnership.createCriteria()
        List<Partnership> resultsPartnership = criteriaPartnership.list {
            approval {
                and {
                    endorser {
                        eq("id", tempUser)
                    }
                    isNotNull('dateEndorsed')
                }
            }
        }

        def criteriaActivity = Activity.createCriteria()
        List<Activity> resultsActivity = criteriaActivity.list {
            approval {
                and {
                    endorser {
                        eq("id", tempUser)
                    }
                    isNotNull('dateEndorsed')
                }
            }
        }

        render(view: "approverHome", model: [resultsPartnership: resultsPartnership, resultsActivity: resultsActivity])
        //render resultsActivity as JSON
    }

    def endorserHome() {

        long tempUser = 2

        //Gets the list of Institutions Endorser
        def criteriaPartnership = Partnership.createCriteria()
        List<Partnership> resultsPartnership = criteriaPartnership.list {
            approval {
                and {
                    approver {
                        eq("id", tempUser)
                    }
                    isNull('dateEndorsed')
                }
            }
        }


        def criteriaActivity = Activity.createCriteria()
        List<Activity> resultsActivity = criteriaActivity.list {
            approval {
                and {
                    approver {
                        eq("id", tempUser)
                    }
                    isNull('dateEndorsed')
                }
            }
        }

        log.debug("Partnership Results: " + resultsPartnership)
        log.debug("Activities Results: " + resultsActivity)


        render(view: "endorserHome", model: [resultsPartnership: resultsPartnership, resultsActivity: resultsActivity])
    }

    def showPartnership(Partnership partnershipInstance) {
        log.debug("Partnership Instance :" + partnershipInstance)
        respond partnershipInstance
    }

    def getInstitutions() {
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

    def getActivities() {

    }

    def getEndorseActivities() {
        def user = params['currentUser']
        user = ''

        long tempUser = 2

        def c = Activity.createCriteria()
        def result = c.list {
            approval {
                and {
                    approver {
                        eq("id", tempUser)
                    }
                    isNull('dateEndorsed')
                }
            }
        }

        render result as JSON
    }

    def getEndorseInstitutions() {
        def user = params['q']
        user = ''

        long tempUser = 2

        def c = Partnership.createCriteria()
        def results = c.list {
            approval {
                and {
                    approver {
                        eq("id", tempUser)
                    }
                    isNull('dateEndorsed')
                }
            }
        }

        render results as JSON
    }


}
