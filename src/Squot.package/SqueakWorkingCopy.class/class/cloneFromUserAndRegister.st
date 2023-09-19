instance creation
cloneFromUserAndRegister
	| name |
	name := self requestUnregisteredName ifNil: [^ nil].
	^ (self cloneFromUserNamed: name)
		register;
		yourself