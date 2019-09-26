testing
includesObjectNamed: name
	^ (objects includesKey: name) or: [super includesObjectNamed: name]