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

        def currentUser = springSecurityService.currentUser
        def user = Person.findByUsername(post.username)//postu oluşturan user
        if(params.comments=="on")
            params.comments = true
        else
            params.comments = false
        params.username = user.username
        println(params)
        def eventPost = new EventPost(params)

        println("İçerik")
        println(eventPost)
         //  eventPost.postId = postId
      //  eventPost.publishDate = new Date()
        eventPost.save()
        redirect("index")
    }


}
