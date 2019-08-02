package eventmanagement

import grails.plugin.springsecurity.annotation.Secured
import javafx.geometry.Pos

class PostController {
    def springSecurityService
    def messageText
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def posts() {
        //Post.getAll()
        int size = Post.getAll().size()

        def Allposts = (Post.getAll()).sort{it.id}
        PostUserEventStatus[] listPost = new PostUserEventStatus[size];


        println("---")
        for (int i=0; i<size; i++) {

            PostUserEventStatus postStatus = new PostUserEventStatus();
            postStatus.post = Allposts[i]

            Participation a = Participation.findByPostIdAndUsername(Allposts[i].getId(), springSecurityService.getCurrentUser().username)
            if(a!=null)
                postStatus.status=true
            else
                postStatus.status=false
            println(postStatus.status)
            listPost[i] = postStatus

        }



        def currentUser = springSecurityService.getCurrentUser()

        render(view:'posts',model:[allposts:Allposts,currentUser:currentUser,messageText:messageText,listPost:listPost])

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

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def join(int postId){
/*
        def query = Participation.where {
            username:'semihunal'
            postId:postId
        }
        Participation c =
  */

        Participation a = Participation.findByPostIdAndUsername(postId,springSecurityService.getCurrentUser().username)
        if(a==null) // kullanıcı katılmamış ... katılma işlemi burada yapılıyor...
        {
            def participation = new Participation(username: springSecurityService.getCurrentUser().username ,postId:postId)
            participation.save(flush: true)
            def post = Post.get(postId);
            post.number+=1;
            post.save(flush:true)

        }
        else {
            messageText = "Zaten bu etkinliğe katıldınız!"
            println("else e girdi")

        }
            redirect(action:'posts')
        //println("post : " + post + Post.get(7).title)
        //render "postId"+postId + " -- " + participation.getUsername() + " -- " + participation.getPostId()

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def notJoin(int postId){

        Participation a = Participation.findByPostIdAndUsername(postId, springSecurityService.getCurrentUser().username)
        if(a!=null) // kullanıcı katılmamış ... katılma işlemi burada yapılıyor...
        {
            a.delete(flush: true)
            def post = Post.get(postId);
            post.number-=1;
            post.save(flush:true)

        }
        else {
            messageText = "Etkinliğe Katılmadınız!"
            println("else e girdi")

        }
        redirect(action:'posts')
        //println("post : " + post + Post.get(7).title)
        //render "postId"+postId + " -- " + participation.getUsername() + " -- " + participation.getPostId()

    }

}

class PostUserEventStatus{
    public Post post
    public boolean status
}