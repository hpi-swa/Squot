instance creation
withChangeSet: aChangeSet model: aMultitextModel from: anObject to: anotherObject
	^ (self withChangeSet: aChangeSet model: aMultitextModel)
		from: anObject;
		to: anotherObject;
		yourself