package com.guru.connectframework.criteria


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CriteriaDataController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CriteriaData.list(params), model: [criteriaDataInstanceCount: CriteriaData.count()]
    }

    def show(CriteriaData criteriaDataInstance) {
        respond criteriaDataInstance
    }

    def create() {
        respond new CriteriaData(params)
    }

    @Transactional
    def save(CriteriaData criteriaDataInstance) {
        if (criteriaDataInstance == null) {
            notFound()
            return
        }

        if (criteriaDataInstance.hasErrors()) {
            respond criteriaDataInstance.errors, view: 'create'
            return
        }

        criteriaDataInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'criteriaData.label', default: 'CriteriaData'), criteriaDataInstance.id])
                redirect criteriaDataInstance
            }
            '*' { respond criteriaDataInstance, [status: CREATED] }
        }
    }

    def edit(CriteriaData criteriaDataInstance) {
        respond criteriaDataInstance
    }

    @Transactional
    def update(CriteriaData criteriaDataInstance) {
        if (criteriaDataInstance == null) {
            notFound()
            return
        }

        if (criteriaDataInstance.hasErrors()) {
            respond criteriaDataInstance.errors, view: 'edit'
            return
        }

        criteriaDataInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CriteriaData.label', default: 'CriteriaData'), criteriaDataInstance.id])
                redirect criteriaDataInstance
            }
            '*' { respond criteriaDataInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CriteriaData criteriaDataInstance) {

        if (criteriaDataInstance == null) {
            notFound()
            return
        }

        criteriaDataInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CriteriaData.label', default: 'CriteriaData'), criteriaDataInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'criteriaData.label', default: 'CriteriaData'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
