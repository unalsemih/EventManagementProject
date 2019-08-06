package eventmanagement

import grails.plugin.springsecurity.annotation.Secured

class PersonController {

    def springSecurityService

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def profile(String username) {

        def person = Person.findByUsername(username)
        def currentUser = springSecurityService.currentUser

        render(view:'profile',model: [person:person,currentUser:currentUser])
    }
}
