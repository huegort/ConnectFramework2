import com.guru.connectframework.activity.ActivityCategory
import com.guru.connectframework.activity.ActivityType
import com.guru.connectframework.criteria.CriteriaContainer
import com.guru.connectframework.institution.Country
import com.guru.connectframework.institution.Institution
import com.guru.connectframework.institution.Region
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

    }
    def destroy = {
    }
}
