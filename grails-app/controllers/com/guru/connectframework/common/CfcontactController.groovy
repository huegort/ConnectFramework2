package com.guru.connectframework.common
import com.guru.connectframework.institution.Contact
import com.guru.connectframework.institution.Institution
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class CfcontactController {
    def contactService

    def index() { }

    @Transactional
    def createContact() {
        def instituteId = Long.parseLong(params.instituteId)
        Institution institution = Institution.findById(instituteId)

        def contactDataJSON = JSON.parse(params.contact)
        Contact contact = contactService.createContact(contactDataJSON,institution)
        log.debug(contact)

        render model: [contact : contact]
    }

    @Transactional
    def updateContact() {

        def contactDataJSON = JSON.parse(params.contact)
        def contactId = params.contactId

        Contact contact = Contact.findById(contactId)
        contact.properties = contactDataJSON

        contact.save(flush: true)

        render model: [contact : contact]
    }

    def listContactsNoInst () {
        def instituteId = Long.parseLong(params.instituteId)
        def criteria = Contact.createCriteria()
        def result = criteria {
            and {
                eq('institution.id',instituteId)
            }

        }

        render result as JSON
    }

    @Transactional
    def deleteContact () {
        //TODO Archive Contact
        def contactId = params.contactId

        Contact contact = Contact.findById(contactId)
        contact.delete(flush: true)

        def success = [message:'Contact ID: ' + contactId + ' has been deleted']
        render success as JSON
    }

    def findContact () {
        def contactId = params.contactId

        Contact contact = Contact.findById(contactId)

        render contact as JSON
    }
}
