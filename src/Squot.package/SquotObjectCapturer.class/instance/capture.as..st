capturing
capture: anObject as: shadowObjectFactory
	| newShadow |
	anObject ~~ capturedObject
		ifTrue: [objectGraph answer: (objectGraph nameOf: capturedObject)
				whenAskedForTheNameOf: anObject].
	(convertedObjects includesKey: anObject) ifTrue: [^ self].
	newShadow := shadowObjectFactory new.
	self rememberAsShadowOfCapturedObject: newShadow.
	enumeratedObject := anObject.
	newShadow initializeFrom: anObject with: self.
	anObject ~~ capturedObject ifTrue: [newShadow assumeOriginalClassOf: capturedObject].
	^ newShadow