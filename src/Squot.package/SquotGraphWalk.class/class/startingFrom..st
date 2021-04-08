instance creation
startingFrom: anObject
	^ self new
		addFirst: anObject;
		yourself