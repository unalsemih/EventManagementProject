package eventmanagement

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import javafx.geometry.Pos
import org.hibernate.Query

import java.text.DateFormat
import java.text.SimpleDateFormat

class PostController {
    def springSecurityService
    def messageText=""


    def currentUserAvatar(){
        def currentUser = springSecurityService.currentUser
        def person = Person.get(currentUser.id)
        if(person.avatar == null)
            return false
        else
            return true
    }




    @Secured(['ROLE_ADMIN'])
    def createPost() {
        try{

            println("basla")
            println("paramslar : "+params)


            def post = new Post(params)
            if(post.startDate.compareTo(post.endDate)>0) {
                messageText="Başlangıç Tarihi Bitiş Tarihinden daha ileride olamaz!"
                redirect(action: 'posts')
            }
            else {
                // post.startDate = ((Date)(params.startDate)).format("YYYY-MM-DD HH:mm:ss.Ms")
                // println("start date :" + post.startDate)

                // post.number=0;
                post.save(flush: true)

                messageText = "Etkinlik oluşturuldu!"
                redirect(action: 'posts')
            }
        }
        catch (Exception e)
        {
            println(e.getMessage())
        }
    }

    @Secured(['ROLE_ADMIN'])
    def jsCreatePost() {
        try{

            println("basla")
            if(params.description == "")
                params.description = "Açıklama Yok"
            if(params.username=="")
                params.username=springSecurityService.getCurrentUser().username
            println("paramslar : "+params)
            def post = new Post(params)
            post.save(flush: true)

            //   redirect(action:'posts')

        }
        catch (Exception e)
        {
            println(e.getMessage())
        }
    }

    @Secured(['ROLE_ADMIN'])
    def updatePost() {
        def post = Post.get(params.id)
        if(post!=null) {
            post.startDate = params.startDate
            post.endDate = params.endDate
            post.save(flush=true)
        }
        else
            println("post bulunamadı...")
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
            messageText="Etkinliğe katıldınız!"
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
            messageText="Etkinlikten Çıktınız!"
        }
        else {
            messageText = "Etkinliğe Katılmadınız!"
            println("else e girdi")

        }
        redirect(action:'posts')
        //println("post : " + post + Post.get(7).title)
        //render "postId"+postId + " -- " + participation.getUsername() + " -- " + participation.getPostId()

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def calendar(){
        render(view:'calendar',model:[currentUser:springSecurityService.getCurrentUser()])
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def usersJson(int id) {
        def list = Participation.findAllByPostId(id)
        render list as JSON
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def postsJson() {
        def list = Post.getAll()
        render list as JSON
    }

    @Secured(['ROLE_ADMIN'])
    def deletePost() {
        def post = Post.get(params.postId).delete(flush:true)
        messageText="Etkinliğiniz silindi!"
        redirect(action: "posts")
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def posts(String eventType,int categoryId) {
        def message = messageText;
        messageText = ""
        println("durum1")
        if(currentUserAvatar())
            println("true döndü yani var...")
        else
            println("false döndü yani yok")
        //Post.getAll()

        //int size = Post.getAll().size()
        def Allposts
        int size
        println("category durumu : ")
        println(categoryId)
        println("eventtype durumu : ")
        println(eventType)
        if(categoryId!=null && categoryId!=0) {
            Allposts = Post.where {
                categoryId == categoryId
            }.list()

        }
        else if(eventType=="fun")
            Allposts = (Post.findAllByType("fun")).sort{it.id}

        else if(eventType == "education")
            Allposts = (Post.findAllByType("education")).sort { it.id }
        else
            Allposts = (Post.getAll()).sort { it.id }
        println("aaa3")
        size = Allposts.size()
        println("aaa4")
        PostUserEventStatus[] listPost = new PostUserEventStatus[size];


        println("---")
        for (int i=0; i<size; i++) {

            PostUserEventStatus postStatus = new PostUserEventStatus();
            postStatus.post = Allposts[i]

            Participation a = Participation.findByPostIdAndUsername(Allposts[i].id, springSecurityService.getCurrentUser().username)
            if(a!=null)
                postStatus.status=true
            else
                postStatus.status=false
            println(postStatus.status)
            listPost[i] = postStatus

        }

        def categoryList = Category.findAllByType(eventType)

        def currentUser = springSecurityService.getCurrentUser()

        render(view:'posts',model:[allposts:Allposts,currentUser:currentUser,messageText:message,listPost:listPost,eventType:eventType,categoryList:categoryList])

    }
}

class PostUserEventStatus{
    public Post post
    public boolean status
}