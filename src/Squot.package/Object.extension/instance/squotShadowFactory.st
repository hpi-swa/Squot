*Squot-trackable-capturing
squotShadowFactory
	self flag: #deprecated. "Ask the mirror instead."
	^ self class isImmediateClass
		ifTrue: [SquotPrimitiveValue]
		ifFalse: [SquotObjectShadow]