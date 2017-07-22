private
enumerate: anObject shadowFactory: shadowObjectFactory
	| newShadow |
	anObject ~~ capturedObject
		ifTrue: [objectGraph answer: (objectGraph nameOf: capturedObject)
				whenAskedForTheNameOf: anObject].
	(convertedObjects includesKey: anObject) ifTrue: [^ self].
	newShadow := shadowObjectFactory new.
	convertedObjects at: capturedObject put:
		(SquotNameDecorator on: newShadow withName: (objectGraph nameOf: capturedObject ifAbsent: [])).
	objectGraph addShadow: newShadow of: anObject.
	enumeratedObject := anObject.
	newShadow initializeFrom: anObject with: self.
	anObject ~~ capturedObject ifTrue: [newShadow assumeOriginalClassOf: capturedObject].