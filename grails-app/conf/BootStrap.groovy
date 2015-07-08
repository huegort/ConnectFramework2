import com.guru.connectframework.CriteriaStatus
import com.guru.connectframework.activity.Activity
import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.institution.Country
import com.guru.connectframework.institution.Institution
import com.guru.connectframework.institution.Region
import com.guru.connectframework.partnership.Partnership
import com.guru.connectframework.partnership.PartnershipLevel
import grails.converters.JSON
import prototyping.luis.PrototypeActivity
import prototyping.luis.PrototypePartnership

class BootStrap {

    def init = { servletContext ->
        JSON.registerObjectMarshaller(PrototypePartnership) {
            def returnArray = [:]
            returnArray['name'] = it.name
            returnArray['institute'] = it.institute
            returnArray['activities'] = it.activities
            return returnArray
        }
        JSON.registerObjectMarshaller(PrototypeActivity) {
            def returnArray =[:]
            returnArray['id'] = it.id
            returnArray['name'] = it.name
            returnArray['description'] = it.description
            return returnArray
        }
        JSON.registerObjectMarshaller(Institution) {
            def returnArray =[:]
            returnArray['id'] = it.id
            returnArray['country'] = it.country
            returnArray['description'] = it.description
            returnArray['name'] = it.name
            returnArray['notes'] = it.notes
            return returnArray
        }
        JSON.registerObjectMarshaller(Country) {
            def returnArray =[:]
            returnArray['id'] = it.id
            returnArray['name'] = it.name
            returnArray['region'] = it.region
            return returnArray
        }
        JSON.registerObjectMarshaller(Region) {
            def returnArray =[:]
            returnArray['id'] = it.id
            returnArray['name'] = it.name
            return returnArray
        }

        JSON.registerObjectMarshaller(ActivityCategory) {
            def returnArray =[:]
            returnArray['id'] = it.id
            returnArray['name'] = it.name
            return returnArray
        }

        JSON.registerObjectMarshaller(ActivityType) {
            def returnArray =[:]
            returnArray['id'] = it.id
            returnArray['category'] = ["id": it.category.id]
            returnArray['criteriaContainer'] = ["id": it.criteriaContainer.id]
            returnArray['description'] = it.description
            returnArray['document'] = it.document
            returnArray['name'] = it.name
            returnArray['requiredLevel'] = ["id": it.requiredLevel.id]
            returnArray['urlToDoc'] = it.urlToDoc
            return returnArray
        }

        JSON.registerObjectMarshaller(CriteriaContainer) {
            def returnArray =[:]
            returnArray['id'] = it.id
            return returnArray
        }

        JSON.registerObjectMarshaller(CriteriaContainer) {
            def returnArray =[:]
            returnArray['id'] = it.id
            return returnArray
        }

        JSON.registerObjectMarshaller(PartnershipLevel) {
            def returnArray =[:]
            returnArray['id'] = it.id
            return returnArray
        }

        JSON.registerObjectMarshaller(Activity) {
            def returnArray =[:]
            returnArray['id'] = it.id
            returnArray['activityType'] = ["id": it.activityType.id]
            returnArray['agreementTemplate'] = ["id": it.agreementTemplate.id]
            returnArray['approval'] = ["id": it.approval.id, "status": it.approval.status, "dateCreated": it.approval.created]
            returnArray['contact'] = ["id": it.contact.id]
            returnArray['current'] = it.current
            returnArray['dataContainer'] = ["id": it.dataContainer.id]
            returnArray['description'] = it.description
            returnArray['finalAgreement'] = ["id": it.finalAgreement.id]
            returnArray['name'] = it.name
            returnArray['owner'] = ["id": it.owner.id]
            returnArray['finalAgreement'] = ["id": it.finalAgreement.id]
            returnArray['partnership'] = ["id": it.partnership.id, "institution": it.partnership.institution]

            return returnArray
        }

        JSON.registerObjectMarshaller(CriteriaStatus) {
            def returnArray =[:]
            returnArray['name'] = it.toString()
            return returnArray
        }

        JSON.registerObjectMarshaller(Partnership) {
            def returnArray =[:]
            returnArray['id'] = it.id
            returnArray['activities'] = ["id": it.activities.id]
            returnArray['approval'] = ["id": it.approval.id]
            returnArray['contact'] = ["id": it.contact.id]
            returnArray['current'] = it.current
            returnArray['dataContainer'] = ["id": it.dataContainer.id]
            returnArray['institution'] = ["id": it.institution.id]
            returnArray['name'] = it.name
            returnArray['partnershipLevel'] = ["id": it.partnershipLevel.id]

            return returnArray
        }

    }
    def destroy = {
    }
}
