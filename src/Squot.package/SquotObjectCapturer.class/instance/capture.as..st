capturing
capture: anObject as: shadowObjectFactory
	| newShadow |
	"if capturedObject is replaced by anObject for capturing, remember the capturedObject's name"
	self flag: #deprecated. "Superseded by capture: anObject in: aSquotMirror"
	anObject ~~ capturedObject
		ifTrue: [objectGraph answer: (objectGraph nameOf: capturedObject)
				whenAskedForTheNameOf: anObject].
	convertedObjects at: anObject ifPresent: [:existing | ^ existing].
	newShadow := shadowObjectFactory new.
	self rememberAsShadowOfCapturedObject: newShadow.
	enumeratedObject := anObject.
	newShadow initializeFrom: anObject with: self.
	anObject ~~ capturedObject ifTrue: [newShadow assumeOriginalClassOf: capturedObject].
	^ newShadow