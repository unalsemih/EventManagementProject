package eventmanagement

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class PersonController {

    def springSecurityService

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def profile(String username) {

        def person = Person.findByUsername(username)
        def currentUser = springSecurityService.currentUser

        render(view:'profile',model: [person:person,currentUser:currentUser])
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def getUserRole() {
        String[] userRole = new String[1];

        Person person = springSecurityService.currentUser
        def roleDefault = Role.findByAuthority("ROLE_USER")
        if(person.authorities.contains(roleDefault))
        {
            userRole[0]="ROLE_USER"
            render userRole as JSON
        }
        def roleAdmin = Role.findByAuthority("ROLE_ADMIN")
        if(person.authorities.contains(roleAdmin))
        {
            userRole[0]="ROLE_ADMIN"
            render userRole as JSON
        }
    }



}
