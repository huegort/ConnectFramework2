package com.guru.connectframework.Activity


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActivityTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ActivityType.list(params), model: [activityTypeInstanceCount: ActivityType.count()]
    }

    def show(ActivityType activityTypeInstance) {
        respond activityTypeInstance
    }

    def create() {
        respond new ActivityType(params)
    }

    @Transactional
    def save(ActivityType activityTypeInstance) {
        if (activityTypeInstance == null) {
            notFound()
            return
        }

        if (activityTypeInstance.hasErrors()) {
            respond activityTypeInstance.errors, view: 'create'
            return
        }

        activityTypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'activityType.label', default: 'ActivityType'), activityTypeInstance.id])
                redirect activityTypeInstance
            }
            '*' { respond activityTypeInstance, [status: CREATED] }
        }
    }

    def edit(ActivityType activityTypeInstance) {
        respond activityTypeInstance
    }

    @Transactional
    def update(ActivityType activityTypeInstance) {
        if (activityTypeInstance == null) {
            notFound()
            return
        }

        if (activityTypeInstance.hasErrors()) {
            respond activityTypeInstance.errors, view: 'edit'
            return
        }

        activityTypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ActivityType.label', default: 'ActivityType'), activityTypeInstance.id])
                redirect activityTypeInstance
            }
            '*' { respond activityTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ActivityType activityTypeInstance) {

        if (activityTypeInstance == null) {
            notFound()
            return
        }

        activityTypeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ActivityType.label', default: 'ActivityType'), activityTypeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityType.label', default: 'ActivityType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
