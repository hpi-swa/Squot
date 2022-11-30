testing
includesObjectNamed: name
	^ (objects at: name ifAbsent: []) notNil or: [super includesObjectNamed: name]