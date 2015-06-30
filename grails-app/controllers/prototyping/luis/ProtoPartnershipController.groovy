package prototyping.luis
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProtoPartnershipController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def jsonPartner = {
        def partnerA = new PrototypePartnership(name: "Partnership A", institute: "Institute A")

        partnerA.addToActivities(new PrototypeActivity(name: "ActivityA", description: "Some description"))
        partnerA.addToActivities(new PrototypeActivity(name: "ActivityB", description: "Some description"))
        partnerA.addToActivities(new PrototypeActivity(name: "ActivityC", description: "Some description"))
        def result = [partner: partnerA]
        render partnerA as JSON
    }


}
