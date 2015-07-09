package com.guru.connectframework.partnership



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PartnershipController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Partnership.list(params), model:[partnershipInstanceCount: Partnership.count()]
    }

    def show(Partnership partnershipInstance) {
        respond partnershipInstance
    }

    def create() {
        respond new Partnership(params)
    }

    @Transactional
    def save(Partnership partnershipInstance) {
        if (partnershipInstance == null) {
            notFound()
            return
        }

        if (partnershipInstance.hasErrors()) {
            respond partnershipInstance.errors, view:'create'
            return
        }

        partnershipInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'partnership.label', default: 'Partnership'), partnershipInstance.id])
                redirect partnershipInstance
            }
            '*' { respond partnershipInstance, [status: CREATED] }
        }
    }

    def edit(Partnership partnershipInstance) {
        respond partnershipInstance
    }

    @Transactional
    def update(Partnership partnershipInstance) {
        if (partnershipInstance == null) {
            notFound()
            return
        }

        if (partnershipInstance.hasErrors()) {
            respond partnershipInstance.errors, view:'edit'
            return
        }

        partnershipInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Partnership.label', default: 'Partnership'), partnershipInstance.id])
                redirect partnershipInstance
            }
            '*'{ respond partnershipInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Partnership partnershipInstance) {

        if (partnershipInstance == null) {
            notFound()
            return
        }

        partnershipInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Partnership.label', default: 'Partnership'), partnershipInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'partnership.label', default: 'Partnership'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
