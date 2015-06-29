package com.guru.connectframework.criteria


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CriteriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Criteria.list(params), model: [criteriaInstanceCount: Criteria.count()]
    }

    def show(Criteria criteriaInstance) {
        respond criteriaInstance
    }

    def create() {
        respond new Criteria(params)
    }

    @Transactional
    def save(Criteria criteriaInstance) {
        if (criteriaInstance == null) {
            notFound()
            return
        }

        if (criteriaInstance.hasErrors()) {
            respond criteriaInstance.errors, view: 'create'
            return
        }

        criteriaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'criteria.label', default: 'Criteria'), criteriaInstance.id])
                redirect criteriaInstance
            }
            '*' { respond criteriaInstance, [status: CREATED] }
        }
    }

    def edit(Criteria criteriaInstance) {
        respond criteriaInstance
    }

    @Transactional
    def update(Criteria criteriaInstance) {
        if (criteriaInstance == null) {
            notFound()
            return
        }

        if (criteriaInstance.hasErrors()) {
            respond criteriaInstance.errors, view: 'edit'
            return
        }

        criteriaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Criteria.label', default: 'Criteria'), criteriaInstance.id])
                redirect criteriaInstance
            }
            '*' { respond criteriaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Criteria criteriaInstance) {

        if (criteriaInstance == null) {
            notFound()
            return
        }

        criteriaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Criteria.label', default: 'Criteria'), criteriaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'criteria.label', default: 'Criteria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
