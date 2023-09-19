instance creation
newFromUserAndRegister
	| name reference |
	name := self requestUnregisteredName ifNil: [^ nil].
	reference := self requestFSReference ifNil: [^ nil].
	^ (self onFSReference: reference named: name)
		register;
		yourself