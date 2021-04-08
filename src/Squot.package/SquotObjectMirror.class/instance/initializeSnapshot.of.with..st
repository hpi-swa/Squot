capturing
initializeSnapshot: aSquotObjectShadow of: anObject with: aSquotObjectCapturer
	| shadowMirror |
	shadowMirror := aSquotObjectShadow class squotMirror.
	aSquotObjectShadow setOriginalClass: class capturedClass: (thisContext objectClass: anObject).
	shadowMirror
		captureReferences: (self referencesFrom: anObject)
		from: anObject
		reflectedIn: self
		into: aSquotObjectShadow
		with: aSquotObjectCapturer.