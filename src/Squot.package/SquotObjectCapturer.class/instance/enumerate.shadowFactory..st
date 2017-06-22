private
enumerate: anObject shadowFactory: shadowObjectFactory
	| newShadow |
	anObject ~~ capturedObject ifTrue:
		[objectRegistry nameOf: anObject
			ifAbsentAssign: [objectRegistry nameOf: capturedObject]].
	(convertedObjects includesKey: anObject) ifTrue: [^ self].
	newShadow := shadowObjectFactory new.
	convertedObjects at: capturedObject put: newShadow.
	enumeratedObject := anObject.
	newShadow initializeFrom: anObject with: self.