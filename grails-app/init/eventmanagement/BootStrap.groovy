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
            def role2 = new Role(authority: 'ROLE_DEFAULT').save()

            def me2 = new Person(username: 'ahmet', password: '123').save()

            PersonRole.create me2, role2

            PersonRole.withSession {
                it.flush()
                it.clear()
            }

    }
    def destroy = {
    }
}
