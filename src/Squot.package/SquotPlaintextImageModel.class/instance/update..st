updating
update: anObject
	super update: anObject.
	anObject = #materialized ifTrue: [self changed: #getText].