package eventmanagement

import grails.databinding.BindingFormat

class Post {

    String title
    String description
    String username
    int number
    int quota
    String type="fun"
    int categoryId
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date startDate
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date endDate

    static constraints = {
        description nullable: true
    }
}
