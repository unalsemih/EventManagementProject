package eventmanagement

import grails.plugin.springsecurity.annotation.Secured


class RequestController {
    def springSecurityService
    def messageText=""

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def join(int groupId,int userId) {
        GroupUsers a = GroupUsers.findByGroupIdAndUserId(groupId as int,userId as int)
        println("deneme1")
        if(a==null) // kullanıcı katılmamış ... katılma işlemi burada yapılıyor...
        {println("deneme2")
            def groupUser = new GroupUsers(userId: userId as int ,groupId: groupId as int)
            groupUser.save(flush: true)
            println("deneme3")
            def group = Community.get(groupId);
            group.number+=1;
            group.save(flush:true)
            println("deneme4")
            messageText="Kullanıcı gruba eklendi!"

            def groupRequest = Requests.findByGroupIdAndUserId(groupId as int,userId as int)
            if(groupRequest !=null)
            groupRequest.delete(flush:true)
        }
        else {
            messageText = "Kullanıcı zaten grupta!"
            println("else e girdi")

        }
        redirect(action:'index')
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def delete(int groupId,int userId) {

        def groupRequest = Requests.findByUserIdAndGroupId(userId as int,groupId as int)
        if(groupRequest!=null) {
            groupRequest.delete()
            messageText = "İsteği iptal ettiniz!"
        }
        else
        {
            messageText="İstek bulunamadı!"
        }
        redirect(action: "index")

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index() {
        def requests = Requests.getAll()
        println(requests)
        for(int i=0; i<requests.size(); i++)
        {
            if (Community.get(requests[i].groupId).status==false as boolean)
                    requests.remove(i)
            else if(springSecurityService.currentUser.id as int != Community.get(requests[i].groupId).userId as int)
                    requests.remove(i)
            else
            println("iç kısım")
            println(requests)
        }
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