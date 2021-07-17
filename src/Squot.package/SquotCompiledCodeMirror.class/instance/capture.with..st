capturing
capture: anObject with: aSquotObjectCapturer
	"Skip check for isBits."
	| newShadow |
	newShadow := self newShadowObject.
	aSquotObjectCapturer rememberAsShadowOfCapturedObject: newShadow.
	self initializeSnapshot: newShadow of: anObject with: aSquotObjectCapturer.
	^ newShadow