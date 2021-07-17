capturing
capture: aString with: aSquotObjectCapturer
	| newShadow |
	newShadow := self newShadowObject.
	aSquotObjectCapturer rememberAsShadowOfCapturedObject: newShadow.
	newShadow value: (aString copy flag: #todo). "Using copies of the string means that those string snapshots are still recognized as real strings by the meta object protocol.".
	^ newShadow