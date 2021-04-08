capturing
capture: anObject in: aSquotMirror
	| newShadow |
	"if capturedObject is replaced by anObject for capturing, remember the capturedObject's name"
	anObject ~~ capturedObject
		ifTrue: [objectGraph answer: (objectGraph nameOf: capturedObject)
				whenAskedForTheNameOf: anObject].
	convertedObjects at: anObject ifPresent: [:existing | ^ existing].
	mirrors at: anObject put: aSquotMirror.
	newShadow := aSquotMirror newShadowObject.
	self rememberAsShadowOfCapturedObject: newShadow.
	enumeratedObject := anObject.
	aSquotMirror initializeSnapshot: newShadow of: anObject with: self.
	anObject ~~ capturedObject ifTrue: [newShadow assumeOriginalClassOf: capturedObject].
	^ newShadow