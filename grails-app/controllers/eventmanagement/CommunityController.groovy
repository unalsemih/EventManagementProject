package eventmanagement

import grails.plugin.springsecurity.annotation.Secured

class CommunityController {
    def messageText=""
    def springSecurityService
    def index() {

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def groups(){
        def groups = Community.getAll()
        def message
        if(messageText!="") {
            message = messageText
            messageText=""
        }

        render (view:"groups",model: [currentUser:springSecurityService.currentUser,
                                      groups:groups,
                                      message:message]);

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def createGroup(){
        def group = new Community(params).save(flush:true)
        messageText="Grup Oluşturma işlemi tamamlandı!"
        redirect(action: 'groups')
    }

}
