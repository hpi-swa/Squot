updating
update: anObject
	super update: anObject.
	anObject = #config ifTrue: [self changed: #remoteList].