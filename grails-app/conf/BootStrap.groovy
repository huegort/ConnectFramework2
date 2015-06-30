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
            returnArray['name'] = it.name
            returnArray['description'] = it.description
            return returnArray
        }
    }
    def destroy = {
    }
}
