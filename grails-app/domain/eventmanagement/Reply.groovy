package eventmanagement

import grails.databinding.BindingFormat

class Reply {



    String username
    int commentId
    String text
    int eventPostId
    int postId
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date date

    static constraints = {
        date nullable: true
    }
}
