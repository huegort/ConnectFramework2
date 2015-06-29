import grails.converters.JSON
import prototyping.luis.ProtoActivity
import prototyping.luis.ProtoPartnership

class BootStrap {

    def init = { servletContext ->
        JSON.registerObjectMarshaller(ProtoPartnership) {
            def returnArray = [:]
            returnArray['name'] = it.name
            returnArray['institute'] = it.institute
            returnArray['activities'] = it.activities
            return returnArray
        }
        JSON.registerObjectMarshaller(ProtoActivity) {
            def returnArray =[:]
            returnArray['name'] = it.name
            returnArray['description'] = it.description
            return returnArray
        }
    }
    def destroy = {
    }
}
