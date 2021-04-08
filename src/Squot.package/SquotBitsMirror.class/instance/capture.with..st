capturing
capture: anObject with: aSquotObjectCapturer
	| newShadow |
	newShadow :=  self newShadowObject.
	aSquotObjectCapturer rememberAsShadowOfCapturedObject: newShadow.
	newShadow copyBitsFrom: anObject.
	^ newShadow