package com.guru.connectframework.criteria


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CriteriaContainerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CriteriaContainer.list(params), model: [criteriaContainerInstanceCount: CriteriaContainer.count()]
    }

    def show(CriteriaContainer criteriaContainerInstance) {
        respond criteriaContainerInstance
    }

    def create() {
        respond new CriteriaContainer(params)
    }

    @Transactional
    def save(CriteriaContainer criteriaContainerInstance) {
        if (criteriaContainerInstance == null) {
            notFound()
            return
        }

        if (criteriaContainerInstance.hasErrors()) {
            respond criteriaContainerInstance.errors, view: 'create'
            return
        }

        criteriaContainerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'criteriaContainer.label', default: 'CriteriaContainer'), criteriaContainerInstance.id])
                redirect criteriaContainerInstance
            }
            '*' { respond criteriaContainerInstance, [status: CREATED] }
        }
    }

    def edit(CriteriaContainer criteriaContainerInstance) {
        respond criteriaContainerInstance
    }

    @Transactional
    def update(CriteriaContainer criteriaContainerInstance) {
        if (criteriaContainerInstance == null) {
            notFound()
            return
        }

        if (criteriaContainerInstance.hasErrors()) {
            respond criteriaContainerInstance.errors, view: 'edit'
            return
        }

        criteriaContainerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CriteriaContainer.label', default: 'CriteriaContainer'), criteriaContainerInstance.id])
                redirect criteriaContainerInstance
            }
            '*' { respond criteriaContainerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CriteriaContainer criteriaContainerInstance) {

        if (criteriaContainerInstance == null) {
            notFound()
            return
        }

        criteriaContainerInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CriteriaContainer.label', default: 'CriteriaContainer'), criteriaContainerInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'criteriaContainer.label', default: 'CriteriaContainer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
