package com.guru.connectframework

import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaDataContainer
import com.guru.connectframework.institution.Contact
import com.guru.connectframework.institution.Institution
import com.guru.connectframework.partnership.Partnership
import com.guru.connectframework.partnership.PartnershipLevel
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement
import org.grails.datastore.mapping.validation.ValidationException

@Transactional
class PartnershipService {
    private static final log = LogFactory.getLog(this)
    def userService

    def createTempPartnership(Approval approval, PartnershipLevel partnershipLevel, Institution institution){
        Partnership partnership = new Partnership()
        partnership.name = partnershipLevel.name
        partnership.partnershipLevel = partnershipLevel
        partnership.approval = approval
        partnership.owner = userService.currentUser
        partnership.institution = institution


        partnership.dataContainer = new CriteriaDataContainer()
        return partnership
    }

    def createPartnership(Approval approval , Institution institution, PartnershipLevel partnershipLevel, JSONElement partnershipJSON ,JSONElement criteriaDataJSON) {
        Partnership partnership = new Partnership(partnershipJSON)

        partnership.owner = userService.currentUser
        partnership.approval= approval
        partnership.partnershipLevel = partnershipLevel
        partnership.institution = institution
        partnership.dataContainer = new CriteriaDataContainer()


        // todo sort this out
        partnership.contact = Contact.get(1)

        partnershipLevel.criteria.each {criteria ->
            partnership.dataContainer.setOfCriteriaData.add( criteria.dataType.getData(criteria,criteriaDataJSON, partnership.approval, partnership.dataContainer))
        }

        try {
            partnership.approval.save(flush: true, failOnError: true)
            partnership.dataContainer.save(flush:true, failOnError: true)
            partnership.save(flush: true, failOnError: true)
            log.debug(institution.partnerships)
            institution.partnerships += partnership
            institution.save(flush: true, failOnError: true)
        }catch (ValidationException e) {
            e.printStackTrace()
        }
            log.debug("partnership saved")
        return partnership
    }
    Partnership getHighest(Institution institution){
        int currentHighestLevel = 0
        log.debug("institution :"+ institution)
        log.debug("the partnerships for this institution :"+institution.partnerships)

        institution.partnerships.each {partnership ->
            if (partnership.partnershipLevel.level > currentHighestLevel && partnership.approval.validTo >  new Date() ){
                institution.currentHighest = partnership
                currentHighestLevel = partnership.partnershipLevel.level
            }

        }
        institution.save(flush: true, failOnError: true)
        return institution.currentHighest

    }
    def createPartnershipLevel() {

    }
}
