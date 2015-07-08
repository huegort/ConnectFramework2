package com.guru.connectframework

import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaDataContainer
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
    def approvalService


    def createPartnership(JSONElement approvalJSON, Institution institution, PartnershipLevel partnershipLevel, JSONElement partnershipJSON ,JSONElement criteriaDataJSON) {
        Partnership partnership = new Partnership(partnershipJSON)


        log.debug("approval: "+ approvalJSON)
        //TODO get the owner from the secrurity framework
        partnership.owner = User.get(1)
        partnership.approval= approvalService.createApprovalFromJSON(approvalJSON)
        partnership.partnershipLevel = partnershipLevel
        log.debug("Institution:"+ institution)
        partnership.institution = institution
        partnership.dataContainer = new CriteriaDataContainer()



        partnershipLevel.criteria.each {criteria ->
            //log.debug(criteriaDataJSON)

            partnership.dataContainer.setOfCriteriaData.add( criteria.dataType.getData(criteria,criteriaDataJSON, partnership.approval, partnership.dataContainer))
        }


        try {
            partnership.approval.save(flush: true, failOnError: true)
            partnership.dataContainer.save(flush:true, failOnError: true)
            partnership.dataContainer.save(flush: true, failOnError: true)
            log.debug("partner intst: "+ partnership.institution)
            partnership.save(flush: true, failOnError: true)
        }catch (ValidationException e) {
            e.printStackTrace()
        }
            log.debug("5well I think that should be saved now")


    }
}
