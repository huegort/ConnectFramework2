package prototyping.luis
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProtoPartnershipController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def jsonPartner = {
        def partnerA = new ProtoPartnership(name: "Partnership A", institute: "Institute A")
        //Need some work on how to add a 'belongsto' object
        partnerA.addToActivities(new ProtoActivity(name: "ActivityA", description: "Some description"))
        partnerA.addToActivities(new ProtoActivity(name: "ActivityB", description: "Some description"))
        partnerA.addToActivities(new ProtoActivity(name: "ActivityC", description: "Some description"))
        def result = [partner: partnerA]
        render partnerA as JSON
    }


}
