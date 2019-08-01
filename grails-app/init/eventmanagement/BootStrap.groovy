package eventmanagement

class BootStrap {

    def init = { servletContext ->

              //Person1
            def role = new Role(authority: 'ROLE_ADMIN').save()

            def me = new Person(username: 'semihunal', password: '123456').save()

            PersonRole.create me, role

            PersonRole.withSession {
                it.flush()
                it.clear()
            }

            //Person2
            def role2 = new Role(authority: 'ROLE_USER').save()

            def me2 = new Person(username: 'ahmet', password: '123').save()

            PersonRole.create me2, role2

            PersonRole.withSession {
                it.flush()
                it.clear()
            }

            def a= new Post(title: 'Title1',description: 'Description1',number: '20',username: 'Semih').save(flush: true)
            def b= new Post(title: 'Title2',description: 'Description2',number: '21',username: 'Cuma').save(flush: true)
            def c= new Post(title: 'Title1',description: 'Description1',number: '22',username: 'Ahmet').save(flush: true)
            new Post(title: 'Title2',description: 'Description2',number: '23',username: 'Mehmet').save(flush: true)
       //     new Participation(PostId: a.id, username: me.username).save()
    }
    def destroy = {
    }
}
