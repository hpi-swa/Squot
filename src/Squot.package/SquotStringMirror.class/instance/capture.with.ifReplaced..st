capturing
capture: aString with: aSquotObjectCapturer ifReplaced: aBlock
	| newShadow |
	newShadow := self newShadowObject.
	aSquotObjectCapturer rememberAsShadowOfCapturedObject: newShadow.
	self initializeSnapshot: newShadow of: aString with: aSquotObjectCapturer.
	^ newShadow