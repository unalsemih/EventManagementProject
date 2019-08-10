package eventmanagement

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

class SignUpController {

    def springSecurityService

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index() {
        render(view:'index')
    }

    @Secured("ROLE_ADMIN")
    def newPerson(){

    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def upload(){
        def user = Person.findById(springSecurityService.currentUser.id)
       // CommonsMultipartFile file = params.list("photo")?.getAt(0)
       // user.avatar = file?.bytes
        user.avatar = params.photo.bytes
        user.photo=true
        user.save(flush:true)
        def targetUri = params.targetUri ?: "/"
        redirect(uri: targetUri)
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def removeAvatar(){
        def user = Person.findById(2)
        // CommonsMultipartFile file = params.list("photo")?.getAt(0)
        // user.avatar = file?.bytes
        user.avatar = null
        user.photo=false
        user.save(flush:true)
        def targetUri = params.targetUri ?: "/"
        redirect(uri: targetUri)
    }

/*
     void displayLogo = {

        def sponsor = Person.get(2)
        response.contentType = "image/jpeg"
        response.contentLength = sponsor?.avatar.length
        response.outputStream.write(sponsor?.avatar)
    }
*/
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def displayAvatarForCurrentUser() {
        Person person = Person.get(springSecurityService.currentUser.id)
       // SartUser sartUser = SartUser.findByUsername(user.username)
        response.outputStream << person.avatar // write the photo to the outputstream
        response.outputStream.flush()
    }
}
