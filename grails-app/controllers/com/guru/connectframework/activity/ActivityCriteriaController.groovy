package com.guru.connectframework.activity


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActivityCriteriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ActivityCriteria.list(params), model: [activityCriteriaInstanceCount: ActivityCriteria.count()]
    }

    def show(ActivityCriteria activityCriteriaInstance) {
        respond activityCriteriaInstance
    }

    def create() {
        respond new ActivityCriteria(params)
    }

    @Transactional
    def save(ActivityCriteria activityCriteriaInstance) {
        if (activityCriteriaInstance == null) {
            notFound()
            return
        }

        if (activityCriteriaInstance.hasErrors()) {
            respond activityCriteriaInstance.errors, view: 'create'
            return
        }

        activityCriteriaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'activityCriteria.label', default: 'ActivityCriteria'), activityCriteriaInstance.id])
                redirect activityCriteriaInstance
            }
            '*' { respond activityCriteriaInstance, [status: CREATED] }
        }
    }

    def edit(ActivityCriteria activityCriteriaInstance) {
        respond activityCriteriaInstance
    }

    @Transactional
    def update(ActivityCriteria activityCriteriaInstance) {
        if (activityCriteriaInstance == null) {
            notFound()
            return
        }

        if (activityCriteriaInstance.hasErrors()) {
            respond activityCriteriaInstance.errors, view: 'edit'
            return
        }

        activityCriteriaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ActivityCriteria.label', default: 'ActivityCriteria'), activityCriteriaInstance.id])
                redirect activityCriteriaInstance
            }
            '*' { respond activityCriteriaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ActivityCriteria activityCriteriaInstance) {

        if (activityCriteriaInstance == null) {
            notFound()
            return
        }

        activityCriteriaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ActivityCriteria.label', default: 'ActivityCriteria'), activityCriteriaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCriteria.label', default: 'ActivityCriteria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
