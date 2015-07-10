package com.guru.connectframework

import com.guru.connectframework.criteria.CriteriaData
import com.guru.connectframework.partnership.Partnership

class CfApprovalController {

    def approvePartnership() {
        Partnership partnership = Partnership.get(params.partnershipId)

        SortedSet<CriteriaData> setOfcriteriaData = partnership.criteriaData

        render  (view :"approvepartnership", model: [ partnership : partnership , setOfCriteriaData: setOfcriteriaData])

    }
    def approveActivity(){

    }
    def endorsePartnership(){

    }
    def endorseActivity(){

    }
}
