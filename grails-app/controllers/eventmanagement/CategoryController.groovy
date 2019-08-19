package eventmanagement

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class CategoryController {

    def index() { }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def getCategory(String type)
    {
        def categories = Category.findAllByType(type)
        render categories as JSON
    }
}
