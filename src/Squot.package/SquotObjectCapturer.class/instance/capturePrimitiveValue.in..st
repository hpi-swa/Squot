capturing
capturePrimitiveValue: anObject in: aMirror
	self flag: #deprecated. "Use SquotSystemSingletonMirror or SquotOpaqueValueMirror instead."
	^ SquotPrimitiveValue for: anObject