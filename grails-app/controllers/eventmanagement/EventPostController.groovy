package eventmanagement

import grails.plugin.springsecurity.annotation.Secured

class EventPostController {
    def springSecurityService


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index(int id) {
        def currentUser = springSecurityService.currentUser
        println("id: "+id)
        println(id)
        def post = Post.get(id)
        def user = Person.findByUsername(post.username)//postu oluşturan user

        println(post)
        render (view:"ePost",model: [currentUser:currentUser,post:post,user:user]);
    }



    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def newEventPost() {
        def ep = new EventPost()
        println("gelenveriler")
        if(params.comments=="on")
            ep.comments = true
        else
            ep.comments = false
        def currentUser = springSecurityService.currentUser
        ep.username = currentUser.username
        ep.title = params.title
        ep.text = params.text
        ep.postId = params.postId
        ep.save(flush:true)
        println("İçerik")
        println(ep)

        forward action: 'index', params: [id: params.postId]
    }


}
