package eventmanagement

import grails.plugin.springsecurity.annotation.Secured

import java.security.acl.Group

class CommunityController {
    def messageText=""
    def springSecurityService
    def index() {

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def groups(){
        println("ww")
        def groups = Community.getAll()
        def message
        CommunityStatus[] gruplar = new CommunityStatus[groups.size()]
        for(int i=0; i<groups.size(); i++)
        {
            println("wwa"+i)
            CommunityStatus communityStatus= new CommunityStatus()
            communityStatus.community = groups[i]
            println("wwaa"+i)
            def request = Requests.findByUserIdAndGroupId(springSecurityService.getCurrentUser().id as int,groups[i].id as int)
            println("wwade"+i)
            if(request!=null)
                communityStatus.status = "Beklemede"
            else if(request==null)
            {
                println("wwaqq"+i)
                //Katılmış ya da istek atmamış
                def groupUsers  = GroupUsers.findByUserIdAndGroupId(springSecurityService.getCurrentUser().id as int,groups[i].id as int)
                if(groupUsers!=null)
                    communityStatus.status="Gruptan Ayrıl"
                else
                    communityStatus.status = "Katıl"
                println("rr"+i)
            }

            gruplar[i] = communityStatus

        }
        if(messageText!="") {
            message = messageText
            messageText=""
        }
        println("wwqq")
        render (view:"groups",model: [currentUser:springSecurityService.currentUser,
                                      groups:gruplar,
                                      message:message]);

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def requests(int groupId) {

        def groupRequest = Requests.getAll()
        render (view:"groups",model: [currentUser:springSecurityService.currentUser,
                                      requests:groupRequest,
                                      message:message]);

    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def joinRequest(int groupId){


            def groupRequest = new Requests(userId: springSecurityService.getCurrentUser().id, groupId: groupId).save(flush: true)
            messageText = "Gruba Katılma İsteğiniz Alındı!"





/*
        GroupUsers a = GroupUsers.findByGroupIdAndUserId(groupId,springSecurityService.getCurrentUser().id)
        if(a==null) // kullanıcı katılmamış ... katılma işlemi burada yapılıyor...
        {
            def groupUser = new GroupUsers(userId: springSecurityService.getCurrentUser().id,groupId: groupId)
            groupUser.save(flush: true)
            def group = Group.get(groupId);
            group.number+=1;
            group.save(flush:true)
            messageText="Etkinliğe katıldınız!"
        }
        else {
            messageText = "Zaten bu etkinliğe katıldınız!"
            println("else e girdi")

        }
        redirect(action:'posts')
*/

        redirect(action: 'groups')
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def createGroup(){
        def group = new Community(params).save(flush:true)
        messageText="Grup Oluşturma işlemi tamamlandı!"
        redirect(action: 'groups')
    }

}

class CommunityStatus
{
    public Community community
    public String status
}