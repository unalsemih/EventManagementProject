package eventmanagement

import grails.databinding.BindingFormat

class EventPost {

    String title=" "
    String text
    String postId
    String username
    Boolean comments
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date publishDate

    static constraints = {
        publishDate nullable: true
    }
}
