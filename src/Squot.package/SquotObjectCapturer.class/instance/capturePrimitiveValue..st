capturing
capturePrimitiveValue: anObject
	self flag: #deprecated. "Use capturePrimitiveValue: anObject in: aMirror instead."
	^ self capture: anObject as: SquotPrimitiveValue