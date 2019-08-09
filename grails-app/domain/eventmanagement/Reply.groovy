package eventmanagement

import grails.databinding.BindingFormat

class Reply {



    int userId
    int commentId
    String text
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date date



    static constraints = {
    }
}
