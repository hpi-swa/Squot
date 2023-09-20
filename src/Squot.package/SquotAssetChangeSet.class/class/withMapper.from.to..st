instance creation
withMapper: aMapper from: anObject to: anotherObject
	^ (self withMapper: aMapper)
		from: anObject;
		to: anotherObject;
		yourself