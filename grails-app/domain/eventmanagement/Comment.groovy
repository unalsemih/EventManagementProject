package eventmanagement

import grails.databinding.BindingFormat

class Comment {


    int userId
    String text
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date date


    static constraints = {
    }
}
