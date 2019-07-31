package eventmanagement

import grails.plugin.springsecurity.annotation.Secured
import javafx.geometry.Pos

class PostController {
    def springSecurityService
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def posts() {
        println("deneme username"+Post.get(5).title);
        println("deneme username"+Person.get(2).username);

        println("post sayısı : " + post.size())
        println(post)
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
            redirect(action:'posts')
        // render "Hello Admin"

    }
}
