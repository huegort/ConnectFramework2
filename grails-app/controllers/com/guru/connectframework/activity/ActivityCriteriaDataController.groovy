package com.guru.connectframework.activity


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActivityCriteriaDataController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ActivityCriteriaData.list(params), model: [activityCriteriaDataInstanceCount: ActivityCriteriaData.count()]
    }

    def show(ActivityCriteriaData activityCriteriaDataInstance) {
        respond activityCriteriaDataInstance
    }

    def create() {
        respond new ActivityCriteriaData(params)
    }

    @Transactional
    def save(ActivityCriteriaData activityCriteriaDataInstance) {
        if (activityCriteriaDataInstance == null) {
            notFound()
            return
        }

        if (activityCriteriaDataInstance.hasErrors()) {
            respond activityCriteriaDataInstance.errors, view: 'create'
            return
        }

        activityCriteriaDataInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'activityCriteriaData.label', default: 'ActivityCriteriaData'), activityCriteriaDataInstance.id])
                redirect activityCriteriaDataInstance
            }
            '*' { respond activityCriteriaDataInstance, [status: CREATED] }
        }
    }

    def edit(ActivityCriteriaData activityCriteriaDataInstance) {
        respond activityCriteriaDataInstance
    }

    @Transactional
    def update(ActivityCriteriaData activityCriteriaDataInstance) {
        if (activityCriteriaDataInstance == null) {
            notFound()
            return
        }

        if (activityCriteriaDataInstance.hasErrors()) {
            respond activityCriteriaDataInstance.errors, view: 'edit'
            return
        }

        activityCriteriaDataInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ActivityCriteriaData.label', default: 'ActivityCriteriaData'), activityCriteriaDataInstance.id])
                redirect activityCriteriaDataInstance
            }
            '*' { respond activityCriteriaDataInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ActivityCriteriaData activityCriteriaDataInstance) {

        if (activityCriteriaDataInstance == null) {
            notFound()
            return
        }

        activityCriteriaDataInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ActivityCriteriaData.label', default: 'ActivityCriteriaData'), activityCriteriaDataInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCriteriaData.label', default: 'ActivityCriteriaData'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
