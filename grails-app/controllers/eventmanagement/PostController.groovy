package eventmanagement

import grails.plugin.springsecurity.annotation.Secured

class PostController {
    def springSecurityService
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def posts() {
        def staffList = Post.executeQuery("SELECT * from Post )
        println(staffList)

        render(view: 'posts')
    }



    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index() {

        Person person = springSecurityService.currentUser
        def roleDefault = Role.findByAuthority("ROLE_USER")
        if(person.authorities.contains(roleDefault))
         //  redirect(controller: 'hello')
        //   render "Hello Default User"
            redirect(action:'posts')

        def roleAdmin = Role.findByAuthority("ROLE_ADMIN")
        if(person.authorities.contains(roleAdmin))
            render "Hello Admin"

    }
}
