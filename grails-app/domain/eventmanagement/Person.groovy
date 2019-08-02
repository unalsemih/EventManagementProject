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
	byte[] photo

	Set<Role> getAuthorities() {
		(PersonRole.findAllByPerson(this) as List<PersonRole>)*.role as Set<Role>
	}

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true
		photo maxSize: 1024 * 1024 * 2
		photo nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
}
