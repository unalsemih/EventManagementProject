package eventmanagement

class Community {


    int userId
    String name
    String description
    int number=0
    Date date
    boolean status = true
    static constraints = {
        date nullable: true
    }
}
