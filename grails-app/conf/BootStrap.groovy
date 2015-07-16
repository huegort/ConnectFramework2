import com.guru.connectframework.Criteria.CriteriaStatus
import com.guru.connectframework.activity.Activity
import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.criteria.Approval
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.institution.Contact
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
            returnArray['feedback'] = it.notes
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
            returnArray['category'] = ["id": it.category.id, "name": it.category.name]
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
            returnArray['approval'] = ["id": it.approval.id, "status": it.approval.status, "dateCreated": it.approval.created, "dateEndorsed": it.approval.dateEndorsed]
            returnArray['contact'] = it.contact
            returnArray['dataContainer'] = ["id": it.dataContainer.id]
            returnArray['description'] = it.description
            returnArray['name'] = it.name
            returnArray['owner'] = ["id": it.owner.id]
            returnArray['partnership'] = ["id": it.partnership.id, "institution": it.partnership.institution]

            return returnArray
        }

        JSON.registerObjectMarshaller(CriteriaStatus) {
            def returnArray =[:]
            returnArray['name'] = it.toString()
            return returnArray
        }

        JSON.registerObjectMarshaller(Partnership) {
            def returnArray = [:]
            returnArray['id'] = it.id
            returnArray['activities'] = it.activities
            returnArray['approval'] = ["id": it.approval.id,"status": it.approval.status, "dateCreated": it.approval.created, "dateEndorsed": it.approval.dateEndorsed, "approver": ["id": it.approval.approver.id , "name": it.approval.approver.name]]
            returnArray['contact'] = it.contact
            returnArray['dataContainer'] = ["id": it.dataContainer.id]
            returnArray['institution'] = ["id": it.institution.id, "name": it.institution.name]
            returnArray['name'] = it.name
            returnArray['owner'] = ["id": it.owner.id]
            returnArray['partnershipLevel'] = ["id": it.partnershipLevel.id, "name": it.partnershipLevel.name]
            return returnArray

        }

        JSON.registerObjectMarshaller(Approval) {
            def returnArray = [:]
            returnArray['id'] = it.id
            returnArray['approver'] = ["id": it.approver.id, "name": it.approver.name]
            returnArray['created'] = it.created
            returnArray['createdBy'] = ["id": it.createdBy.id]
            returnArray['dateApproved'] = it.dateApproved
            returnArray['dateEndorsed'] = it.dateEndorsed
            returnArray['endorser'] = ["id": it.endorser.id]
            returnArray['feedback'] = it.notes
            returnArray['status'] = it.status
            returnArray['validTo'] = it.validTo
            return returnArray
        }

        JSON.registerObjectMarshaller(Contact) {
            def returnArray = [:]
            returnArray['id'] = it.id
            returnArray['name'] = it.toString()
            return returnArray
        }
    }
    def destroy = {
    }
}
