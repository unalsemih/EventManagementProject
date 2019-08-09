package eventmanagement

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class Person implements Serializable {

	private static final long serialVersionUID = 1

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	byte[] avatar
	boolean photo
	Set<Role> getAuthorities() {
		(PersonRole.findAllByPerson(this) as List<PersonRole>)*.role as Set<Role>
	}

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true
		avatar(nullable:true, maxSize: 1024 * 1024 * 2 /* 2MB */)

	}

	static mapping = {
		password column: '`password`'
	}
}
