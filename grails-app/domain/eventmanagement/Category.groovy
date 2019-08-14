package eventmanagement

import org.hibernate.annotations.GenericGenerator

import javax.persistence.Column
import javax.persistence.GeneratedValue
import javax.persistence.Id

class Category {

    String type
    String name

    static constraints = {
    }
}
