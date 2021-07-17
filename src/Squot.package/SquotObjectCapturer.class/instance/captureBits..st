capturing
captureBits: anObject
	self flag: #deprecated. "Use captureBits: anObject in: aMirror instead."
	^ self capture: anObject as: SquotBitsObjectShadow