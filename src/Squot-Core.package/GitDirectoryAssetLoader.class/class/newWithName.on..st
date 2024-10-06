instance creation
newWithName: aString on: anFSReference
	^ (self newWithName: aString)
		directory: anFSReference;
		yourself