package com.guru.connectframework.activity


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActivityCategoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ActivityCategory.list(params), model: [activityCategoryInstanceCount: ActivityCategory.count()]
    }

    def show(ActivityCategory activityCategoryInstance) {
        respond activityCategoryInstance
    }

    def create() {
        respond new ActivityCategory(params)
    }

    @Transactional
    def save(ActivityCategory activityCategoryInstance) {
        if (activityCategoryInstance == null) {
            notFound()
            return
        }

        if (activityCategoryInstance.hasErrors()) {
            respond activityCategoryInstance.errors, view: 'create'
            return
        }

        activityCategoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'activityCategory.label', default: 'ActivityCategory'), activityCategoryInstance.id])
                redirect activityCategoryInstance
            }
            '*' { respond activityCategoryInstance, [status: CREATED] }
        }
    }

    def edit(ActivityCategory activityCategoryInstance) {
        respond activityCategoryInstance
    }

    @Transactional
    def update(ActivityCategory activityCategoryInstance) {
        if (activityCategoryInstance == null) {
            notFound()
            return
        }

        if (activityCategoryInstance.hasErrors()) {
            respond activityCategoryInstance.errors, view: 'edit'
            return
        }

        activityCategoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ActivityCategory.label', default: 'ActivityCategory'), activityCategoryInstance.id])
                redirect activityCategoryInstance
            }
            '*' { respond activityCategoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ActivityCategory activityCategoryInstance) {

        if (activityCategoryInstance == null) {
            notFound()
            return
        }

        activityCategoryInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ActivityCategory.label', default: 'ActivityCategory'), activityCategoryInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCategory.label', default: 'ActivityCategory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
