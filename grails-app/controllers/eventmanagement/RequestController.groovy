package eventmanagement

import grails.plugin.springsecurity.annotation.Secured


class RequestController {
    def springSecurityService
    def messageText=""

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def join(int groupId) {
        GroupUsers a = GroupUsers.findByGroupIdAndUserId(groupId,springSecurityService.getCurrentUser().id as int)
        if(a==null) // kullanıcı katılmamış ... katılma işlemi burada yapılıyor...
        {
            def groupUser = new GroupUsers(userId: springSecurityService.getCurrentUser().id as int ,groupId: groupId as int)
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
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index() {
        def requests = Requests.getAll()
        def message

        RequestList[] list = new RequestList[requests.size()]

        for(int i=0; i<requests.size(); i++)
        {
            String username = Person.get(requests[i].userId).username
            String groupname = Community.get(requests[i].groupId).name
            RequestList item = new RequestList()
            item.username = username
            item.groupname = groupname
            item.requests = requests[i]
            list[i] = item
        }
        if(messageText!="")
            message = messageText
        messageText=""
        render(view:'requests',model:[requests:list,currentUser:springSecurityService.currentUser,messageText:message])


    }



}

class RequestList{
    public String username
    public String groupname
    public Requests requests
}