package com.guru.connectframework.partnership


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PartnershipLevelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PartnershipLevel.list(params), model: [partnershipLevelInstanceCount: PartnershipLevel.count()]
    }

    def show(PartnershipLevel partnershipLevelInstance) {
        respond partnershipLevelInstance
    }

    def create() {
        respond new PartnershipLevel(params)
    }

    @Transactional
    def save(PartnershipLevel partnershipLevelInstance) {
        if (partnershipLevelInstance == null) {
            notFound()
            return
        }

        if (partnershipLevelInstance.hasErrors()) {
            respond partnershipLevelInstance.errors, view: 'create'
            return
        }

        partnershipLevelInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'partnershipLevel.label', default: 'PartnershipLevel'), partnershipLevelInstance.id])
                redirect partnershipLevelInstance
            }
            '*' { respond partnershipLevelInstance, [status: CREATED] }
        }
    }

    def edit(PartnershipLevel partnershipLevelInstance) {
        respond partnershipLevelInstance
    }

    @Transactional
    def update(PartnershipLevel partnershipLevelInstance) {
        if (partnershipLevelInstance == null) {
            notFound()
            return
        }

        if (partnershipLevelInstance.hasErrors()) {
            respond partnershipLevelInstance.errors, view: 'edit'
            return
        }

        partnershipLevelInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PartnershipLevel.label', default: 'PartnershipLevel'), partnershipLevelInstance.id])
                redirect partnershipLevelInstance
            }
            '*' { respond partnershipLevelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PartnershipLevel partnershipLevelInstance) {

        if (partnershipLevelInstance == null) {
            notFound()
            return
        }

        partnershipLevelInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PartnershipLevel.label', default: 'PartnershipLevel'), partnershipLevelInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'partnershipLevel.label', default: 'PartnershipLevel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
