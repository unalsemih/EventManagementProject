package eventmanagement

import grails.converters.JSON
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


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def displayAvatarForCurrentUser() {
        Person person = Person.get(springSecurityService.currentUser.id)
       // SartUser sartUser = SartUser.findByUsername(user.username)
        response.outputStream << person.avatar // write the photo to the outputstream
        response.outputStream.flush()
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def getUserAvatar(String username) {

        Person person = Person.findByUsername(username)
        PersonAvatar p = new PersonAvatar()
        p.id = person.id
        p.photo = person.photo
        p.avatar = Base64.getEncoder().encodeToString(person.avatar);
        if(person!=null)
            render p as JSON
    }



}

class PersonAvatar{
    public int id
    public Boolean photo
    public String avatar
}