private
enumerate: anObject shadowFactory: shadowObjectFactory
	| newShadow |
	anObject ~~ capturedObject ifTrue:
		[objectGraph nameOf: anObject
			ifAbsentAssign: [objectGraph nameOf: capturedObject]].
	(convertedObjects includesKey: anObject) ifTrue: [^ self].
	newShadow := shadowObjectFactory new.
	convertedObjects at: capturedObject put: newShadow.
	objectGraph addShadow: newShadow of: anObject.
	enumeratedObject := anObject.
	newShadow initializeFrom: anObject with: self.