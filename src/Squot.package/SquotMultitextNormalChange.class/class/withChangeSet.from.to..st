instance creation
withChangeSet: aChangeSet from: anObject to: anotherObject
	^ (self withChangeSet: aChangeSet)
		from: anObject;
		to: anotherObject;
		yourself