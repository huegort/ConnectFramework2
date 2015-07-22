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

    def createContact(JSONElement contactDetails, Institution institution) {
        Contact contact
        //log.debug('In Create new contact ===========>>> '+ contactDetails.toString())
        //log.debug('In Create contact showing institution ' + institution.id)

        try {
                contact = new Contact(contactDetails)
                contact.institution = institution

                /*contact.title = contactJSON["title"]
                contact.firstName = contactJSON["firstName"]
                contact.lastName = contactJSON["latName"]
                contact.roleInInstitution = contactJSON["roleInInstitution"]
                contact.phone = contactJSON["phone"]
                contact.email = contactJSON["email"]*/

                log.debug('This is a Contact ++++======>>>>' + contact.toString())

                contact.save(flush: true, failOnError: true)

        }catch (ValidationException e) {
            e.printStackTrace()
        }

        return contact
        //Tested createNewContact()
    }

    def findContact(String name){

        String[] split = name.split("\\s+")

        def criteria = Contact.createCriteria()
        def result = criteria {
            and {
                split.each { search ->
                    eq('title', search)
                    eq('firstName', search)
                    eq('lastName', search)
                }

            }
        }

        return result
    }
}
