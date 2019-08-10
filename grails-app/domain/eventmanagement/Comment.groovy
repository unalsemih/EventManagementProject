package eventmanagement

import grails.databinding.BindingFormat

class Comment {


    String username
    String text
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date date
    int eventPostId
    int postId
    static constraints = {
        date nullable: true
    }
}
