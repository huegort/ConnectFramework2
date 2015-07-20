package com.guru.connectframework
import com.guru.connectframework.institution.Contact
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class CfcontactController {
    def contactService

    def index() { }

    @Transactional
    def createContact() {
        def contactDataJSON = JSON.parse(params.contact)
        Contact contact = contactService.createContact(contactDataJSON)
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
        def criteria = Contact.createCriteria()
        def result = criteria {
            isNull('institution')
        }

        render result as JSON
    }

    @Transactional
    def deleteContact () {
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
