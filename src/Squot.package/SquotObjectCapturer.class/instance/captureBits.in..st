capturing
captureBits: anObject in: aMirror
	mirrors at: anObject put: aMirror.
	^ self capture: anObject as: SquotBitsObjectShadow