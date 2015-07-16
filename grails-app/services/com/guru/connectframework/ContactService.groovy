package com.guru.connectframework

import com.guru.connectframework.institution.Contact
import com.guru.connectframework.institution.Institution
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.web.json.JSONElement
import org.grails.datastore.mapping.validation.ValidationException

@Transactional
class ContactService {
    private static final log = LogFactory.getLog(this)

    /* --- Type can be 'partnership or activity' --- */

    def getAllContacts(Long id, String type) {

        def criteria = Contact.createCriteria()
        def result = criteria {
            and {
                if (type == 'partnership') {
                    eq('id', id)
                }
                if (type == 'activity') {
                    eq('id', id)
                }
            }
        }

        log.debug(result.toString())
    }

    def createNewContact(JSONElement contactDetails, Institution institution) {
        Contact contact = new Contact()

        try {
            contactDetails.each { contactJSON ->
                contact.title = contactJSON["title"]
                contact.firstName = contactJSON["firstName"]
                contact.lastName = contactJSON["latName"]
                contact.roleInInstitution = contactJSON["roleInInstitution"]
                contact.phone = contactJSON["phone"]
                contact.email = contactJSON["email"]
                contact.institution.properties = institution

                contact.save(flush: true, failOnError: true)

            }
        }catch (ValidationException e) {
            e.printStackTrace()
        }

        //TODO Test createNewContact()
    }
}
