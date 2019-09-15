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

    @Secured(['ROLE_ADMIN'])
    def createPost() { // groovy ile post oluşturma
        try{

            def post = new Post(params)
            if(post.startDate.compareTo(post.endDate)>0) {
                messageText="Başlangıç Tarihi Bitiş Tarihinden daha ileride olamaz!"
                redirect(action: 'posts')
            }
            else {
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
    def jsCreatePost() { // jquery ile takvimden post oluşturma
        try{


            if(params.description == "")
                params.description = "Açıklama Yok"
            if(params.username=="")
                params.username=springSecurityService.getCurrentUser().username
            println("paramslar : "+params)
            def post = new Post(params)
            post.save(flush: true)

        }
        catch (Exception e)
        {
            println(e.getMessage())
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def join(int postId){   //etkinliğe katılma

        Participation a = Participation.findByPostIdAndUsername(postId,springSecurityService.getCurrentUser().username)
        //Daha önce current user bu etkinliğe katılmışmı kontrolü


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
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def notJoin(int postId){ //etkinlikten çıkış

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

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def calendar(){ //etkinliklerin takvim görüntüsü
        def message = messageText;
        messageText = ""

        def Allposts
        int size

            Allposts = (Post.getAll()).sort { it.id }
        Allposts = Allposts.reverse()

        size = Allposts.size()

        PostUserEventStatus[] listPost = new PostUserEventStatus[size];

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



        def currentUser = springSecurityService.getCurrentUser()

        render(view:'calendar',model:[allposts:Allposts,currentUser:currentUser,messageText:message,listPost:listPost])

    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def usersJson(int id) { //kullanıcı getirme id ye göre
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

    @Secured(['ROLE_ADMIN'])
    def getPost(int id){
        def post = Post.get(id as int)
        render post as JSON
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def posts(String eventType,int categoryId) {
        def message = messageText;
        messageText = ""

        def Allposts
        int size
        println(categoryId)
        println(eventType)
        //kategorilere göre postların ekrana getirilmesi
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
        Allposts = Allposts.reverse()
        size = Allposts.size()
        PostUserEventStatus[] listPost = new PostUserEventStatus[size];


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

    @Secured(['ROLE_ADMIN'])
    def editPost() { // post düzenleme
        def post = Post.get(params.id)
        def p = new Post(params)
        post.title=params.title
        post.description=params.description
        post.quota = params.quota as int
        post.startDate = p.startDate
        post.endDate = p.endDate
        post.save(flush:true)
       redirect(action: "posts")
    }


}

class PostUserEventStatus{
    public Post post
    public boolean status
}