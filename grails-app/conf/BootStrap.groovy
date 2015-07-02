import com.guru.connectframework.institution.Country
import com.guru.connectframework.institution.Institution
import com.guru.connectframework.institution.Region
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

    }
    def destroy = {
    }
}
