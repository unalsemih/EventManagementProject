package eventmanagement

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.awt.Image

class EventPostController {
    def springSecurityService
    def messageText=""

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index(int id) {
        def message = messageText;
        messageText = ""
        def currentUser = springSecurityService.currentUser
        println("id: "+id)
        println(id)
        def post = Post.get(id)
        def user = Person.findByUsername(post.username)//postu oluşturan user


        def eventPosts = EventPost.findAllByPostId(id).sort { it.id }
        println(post)

        def photos = Images.findAllByPostId(id)
        def userAvatar = Person.findByUsername(post.username)
        def comments = Comment.findAllByPostId(id)
        def replies = Reply.findAllByPostId(id)
     //   List<String,byte[]> userAvatar = []

        //for(int i=0; i<eventPosts.size(); i++)
        //    userAvatar.push(eventPosts[i].username,Person.findByUsername(eventPosts[i].username).avatar)

        println(photos)

        render (view:"ePost",model: [currentUser:currentUser,post:post,user:user,eventPosts:eventPosts,images:photos,comments:comments,replies:replies,userAvatar:userAvatar,messageText:message]);
    }



    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def newEventPost() {
        println("params")
        println(params)
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
        messageText = "Postunuz Oluşturuldu!"


        for(int i=0; i<params.list("photo")?.size(); i++) {

            if(params.list("photo")?.getAt(i).bytes.size() != 0)
            def photo = new Images(username: ep.username, image: params.list("photo")?.getAt(i).bytes, postId: params.postId, eventPostId: ep.id).save(flush: true)

        }
         println(params.list("photo")?.size())

        //  forward action: 'index', params: [id: params.postId]
        redirect(action: 'index', params: [id: params.postId])
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def newComment() {
        def comment = new Comment()
        comment.username = springSecurityService.currentUser.username
        comment.text = params.text
       // int eventPostId = params.eventPostId as Integer
       // comment.eventPostId = eventPostId
        comment.eventPostId = params.eventPostId as Integer
        comment.postId= params.postId as Integer

        comment.save(flush:true)
        messageText = "Yorumunuz eklendi!"
        redirect(action: 'index', params: [id: params.postId])
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def newReply() {
        def reply = new Reply()
        reply.username = springSecurityService.currentUser.username
        reply.text = params.text
        reply.commentId= params.commentId as Integer

        reply.eventPostId = params.eventPostId as Integer
        reply.postId= params.postId as Integer

        reply.save(flush:true)
        messageText = "Yorumunuz eklendi!"
        redirect(action: 'index', params: [id: params.postId])
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def deleteEventPost() {
        def eventPost = EventPost.get(params.eventPostId).delete(flush:true)
        messageText = "Postunuz başarılı bir şekilde silindi!"
        redirect(action: 'index', params: [id: params.postId])
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def addPhoto(){

    }

        @Secured(['ROLE_ADMIN','ROLE_USER'])
    def uploadPhoto(){
        def user = Person.findById(springSecurityService.currentUser.id)
        // println("Boyut : "+params.list("photo")?.size())
        //println(params.list("photo")?.getAt(0))
        println("içerik uploadPhoto")
            println(params)
      //  println(params.photo)
        for(int i=0; i<params.list("photo")?.size(); i++)
        def photo = new Images(username: user.username ,image: params.list("photo")?.getAt(i).bytes ,postId: params.eventId,eventPostId: params.postId).save(flush:true)
  //      def targetUri = params.targetUri ?: "/"
  //      redirect(uri: targetUri)
        messageText = "Resimleriniz postunuza eklendi!"
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
