capturing
capture: anObject with: aSquotObjectCapturer
	"Use aCapturer to answer a conserved form of me that is suitable to be stored in Snapshots."
	| newShadow |
	newShadow := self newShadowObject.
	aSquotObjectCapturer rememberAsShadowOfCapturedObject: newShadow.
	self initializeSnapshot: newShadow of: anObject with: aSquotObjectCapturer.
	^ newShadow