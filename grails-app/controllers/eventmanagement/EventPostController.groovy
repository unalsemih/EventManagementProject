package eventmanagement

import grails.plugin.springsecurity.annotation.Secured

import java.awt.Image

class EventPostController {
    def springSecurityService


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index(int id) {
        def currentUser = springSecurityService.currentUser
        println("id: "+id)
        println(id)
        def post = Post.get(id)
        def user = Person.findByUsername(post.username)//postu oluşturan user


        def eventPosts = EventPost.findAllByPostId(id)
        println(post)

        def photos = Images.findAllByPostId(id)
        println(photos)

        render (view:"ePost",model: [currentUser:currentUser,post:post,user:user,eventPosts:eventPosts,images:photos]);
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

      //  forward action: 'index', params: [id: params.postId]
        redirect(action: 'index', params: [id: params.postId])
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def uploadPhoto(){
        def user = Person.findById(springSecurityService.currentUser.id)
        // println("Boyut : "+params.list("photo")?.size())
        //println(params.list("photo")?.getAt(0))

      //  println(params.photo)
        for(int i=0; i<params.list("photo")?.size(); i++)
        def photo = new Images(username: user.username ,image: params.list("photo")?.getAt(i).bytes ,postId: params.eventId,eventPostId: params.postId).save(flush:true)
  //      def targetUri = params.targetUri ?: "/"
  //      redirect(uri: targetUri)
        redirect(action: 'index', params: [id: params.eventId])
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def displayPhotos(int id) {
       // def photos = Images.findAllByPostId(id)
       // def image = photos[0].image
        // SartUser sartUser = SartUser.findByUsername(user.username)
      //  response.outputStream << person.avatar // write the photo to the outputstream
      //  response.outputStream.flush()

    }

}
