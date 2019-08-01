package eventmanagement

import grails.plugin.springsecurity.annotation.Secured
import javafx.geometry.Pos

class PostController {
    def springSecurityService
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def posts() {


        //Post.getAll()
        println(Post.getAll().size())

        def Allposts = Post.getAll()
        def currentUser = springSecurityService.getCurrentUser()

        render(view:'posts',model:[allposts:Allposts,currentUser:currentUser])

    }

    @Secured(['ROLE_ADMIN'])
    def createPost() {
        def post = new Post(params)

        post.save(flush: true)
        redirect(action:'posts')

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
          //  redirect(action:'posts')
          //  render "Hello Admin"
            redirect(action:'posts')
        //daha sonra farklı sayfalara yönlendirme yapılabilir
    }
}
