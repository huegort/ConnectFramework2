package com.guru.connectframework.criteria


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CriteriaDataContainerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CriteriaDataContainer.list(params), model: [criteriaDataContainerInstanceCount: CriteriaDataContainer.count()]
    }

    def show(CriteriaDataContainer criteriaDataContainerInstance) {
        respond criteriaDataContainerInstance
    }

    def create() {
        respond new CriteriaDataContainer(params)
    }

    @Transactional
    def save(CriteriaDataContainer criteriaDataContainerInstance) {
        if (criteriaDataContainerInstance == null) {
            notFound()
            return
        }

        if (criteriaDataContainerInstance.hasErrors()) {
            respond criteriaDataContainerInstance.errors, view: 'create'
            return
        }

        criteriaDataContainerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'criteriaDataContainer.label', default: 'CriteriaDataContainer'), criteriaDataContainerInstance.id])
                redirect criteriaDataContainerInstance
            }
            '*' { respond criteriaDataContainerInstance, [status: CREATED] }
        }
    }

    def edit(CriteriaDataContainer criteriaDataContainerInstance) {
        respond criteriaDataContainerInstance
    }

    @Transactional
    def update(CriteriaDataContainer criteriaDataContainerInstance) {
        if (criteriaDataContainerInstance == null) {
            notFound()
            return
        }

        if (criteriaDataContainerInstance.hasErrors()) {
            respond criteriaDataContainerInstance.errors, view: 'edit'
            return
        }

        criteriaDataContainerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CriteriaDataContainer.label', default: 'CriteriaDataContainer'), criteriaDataContainerInstance.id])
                redirect criteriaDataContainerInstance
            }
            '*' { respond criteriaDataContainerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CriteriaDataContainer criteriaDataContainerInstance) {

        if (criteriaDataContainerInstance == null) {
            notFound()
            return
        }

        criteriaDataContainerInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CriteriaDataContainer.label', default: 'CriteriaDataContainer'), criteriaDataContainerInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'criteriaDataContainer.label', default: 'CriteriaDataContainer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
