package prototyping.luis

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
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

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProtoPartnership.list(params), model: [protoPartnershipInstanceCount: ProtoPartnership.count()]
    }

    def show(ProtoPartnership protoPartnershipInstance) {
        respond protoPartnershipInstance
    }

    def create() {
        respond new ProtoPartnership(params)
    }

    @Transactional
    def save(ProtoPartnership protoPartnershipInstance) {
        if (protoPartnershipInstance == null) {
            notFound()
            return
        }

        if (protoPartnershipInstance.hasErrors()) {
            respond protoPartnershipInstance.errors, view: 'create'
            return
        }

        protoPartnershipInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'protoPartnership.label', default: 'ProtoPartnership'), protoPartnershipInstance.id])
                redirect protoPartnershipInstance
            }
            '*' { respond protoPartnershipInstance, [status: CREATED] }
        }
    }

    def edit(ProtoPartnership protoPartnershipInstance) {
        respond protoPartnershipInstance
    }

    @Transactional
    def update(ProtoPartnership protoPartnershipInstance) {
        if (protoPartnershipInstance == null) {
            notFound()
            return
        }

        if (protoPartnershipInstance.hasErrors()) {
            respond protoPartnershipInstance.errors, view: 'edit'
            return
        }

        protoPartnershipInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProtoPartnership.label', default: 'ProtoPartnership'), protoPartnershipInstance.id])
                redirect protoPartnershipInstance
            }
            '*' { respond protoPartnershipInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProtoPartnership protoPartnershipInstance) {

        if (protoPartnershipInstance == null) {
            notFound()
            return
        }

        protoPartnershipInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProtoPartnership.label', default: 'ProtoPartnership'), protoPartnershipInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'protoPartnership.label', default: 'ProtoPartnership'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
