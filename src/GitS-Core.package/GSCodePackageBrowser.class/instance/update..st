updating
update: anObject
	super update: anObject.
	anObject = #mappers ifTrue: [self mappersChanged].