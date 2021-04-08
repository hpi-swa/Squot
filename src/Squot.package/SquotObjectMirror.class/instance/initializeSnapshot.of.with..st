capturing
initializeSnapshot: aSquotObjectShadow of: anObject with: aSquotObjectCapturer
	| shadowMirror |
	shadowMirror := aSquotObjectShadow class squotMirror.
	aSquotObjectShadow setOriginalClass: class capturedClass: (thisContext objectClass: anObject).
	shadowMirror
		captureReferences: ((self referencesFrom: anObject) flag: #todo "squotRelevantInstVars"; yourself)
		from: anObject
		into: aSquotObjectShadow
		with: aSquotObjectCapturer.