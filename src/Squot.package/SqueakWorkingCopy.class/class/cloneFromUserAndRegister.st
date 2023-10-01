instance creation
cloneFromUserAndRegister
	| name |
	name := self requestUnregisteredName ifNil: [^ nil].
	^ ((self cloneFromUserNamed: name) ifNil: [^ nil])
		register;
		yourself