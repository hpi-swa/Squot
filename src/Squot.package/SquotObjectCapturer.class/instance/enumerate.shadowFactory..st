private
enumerate: anObject shadowFactory: shadowObjectFactory
	| newShadow |
	anObject ~~ capturedObject ifTrue:
		[objectNameMapping
			at: anObject
			ifAbsentPut: (objectNameMapping at: capturedObject)].
	(convertedObjects includesKey: anObject) ifTrue: [^ self].
	newShadow := shadowObjectFactory new.
	convertedObjects at: capturedObject put: newShadow.
	enumeratedObject := anObject.
	newShadow initializeFrom: anObject with: self.