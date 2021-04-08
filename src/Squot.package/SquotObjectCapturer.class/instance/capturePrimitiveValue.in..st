capturing
capturePrimitiveValue: anObject in: aMirror
	self flag: #todo. "Check whether immediate objects and global singletons such as true, false, nil should not just stand in for themselves instead of wrapping them."
	mirrors at: anObject put: aMirror.
	^ SquotPrimitiveValue for: anObject