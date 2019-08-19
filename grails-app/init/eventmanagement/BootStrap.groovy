package eventmanagement

class BootStrap {

    def init = { servletContext ->

              //Person1
            def role = new Role(authority: 'ROLE_ADMIN').save()

            def me = new Person(username: 'semihunal', password: '123456',photo: false).save()

            PersonRole.create me, role

            PersonRole.withSession {
                it.flush()
                it.clear()
            }

            //Person2
            def role2 = new Role(authority: 'ROLE_USER').save()

            def me2 = new Person(username: 'ahmet', password: '123',photo: false).save()

            PersonRole.create me2, role2

            PersonRole.withSession {
                it.flush()
                it.clear()
            }
        def me3 = new Person(username: 'melihnl', password: '123456',photo: false).save()

        PersonRole.create me3, role

        PersonRole.withSession {
            it.flush()
            it.clear()
        }
        def me4 = new Person(username: "ismail", password: '123456',photo: false).save()

        PersonRole.create me4, role2

        PersonRole.withSession {
            it.flush()
            it.clear()
        }
       // def a= new Post(title: 'Kartopu Etkinliğii',description: 'Description1',number: '0',username: 'semihunal',quota: '15',startDate: "2019-08-10T13:25",endDate: "2019-08-10T15:25",categoryId: '11').save(flush: true)
       // def b= new Post(title: 'Doğa Yürüyüşü',description: 'Description2',number: '0',username: 'semihunal',quota: '30',startDate: "2019-08-16T13:25",endDate: "2019-08-17T13:25",categoryId: '13').save(flush: true)
       // def c= new Post(title: 'Yaza Merhaba Etkinliği',description: 'Description1',number: '0',username: 'semihunal',quota: '20',startDate: "2019-08-12T13:25",endDate: "2019-08-13T13:25",categoryId: '12').save(flush: true)
       // def d= new Post(title: 'Görüntü İşleme Temelleri',description: 'Description1',number: '0',username: 'semihunal',quota: '20',startDate: "2019-08-12T13:25",type: "education",endDate: "2019-08-13T13:25",categoryId: '11').save(flush: true)

        def course  = new Category(type: "education",name: "Kurs").save()
        def course2  = new Category(type: "education",name: "Sertifikalı Eğitim").save()
        def oyun = new Category(type: "fun", name:"Oyun Turnuvaları").save()
        def oyun2 = new Category(type: "fun", name:"Yemek").save()
        def motivasyon = new Category(type: "fun", name:"Gezi").save()

        ////

        /*     def a= new Post(title: 'Title1',description: 'Description1',number: '20',username: 'Semih',quota: '20',startDate: "2019-08-11 11:11:11.11",endDate: "2019-08-11 11:11:11.11").save(flush: true)
             def b= new Post(title: 'Title2',description: 'Description2',number: '21',username: 'Cuma',quota: '20',startDate: "2019-08-11 11:11:11.11",endDate: "2019-08-11 11:11:11.11").save(flush: true)
             def c= new Post(title: 'Title1',description: 'Description1',number: '22',username: 'Ahmet',quota: '20',startDate: "2019-08-11 11:11:11.11",endDate: "2019-08-11 11:11:11.11").save(flush: true)
             new Post(title: 'Title2',description: 'Description2',number: '23',username: 'Mehmet',quota: '20',startDate: "2019-08-11 11:11:11.11",endDate: "2019-08-11 11:11:11.11").save(flush: true)
      */  //     new Participation(PostId: a.id, username: me.username).save()
    }
    def destroy = {
    }
}
