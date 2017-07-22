*Squot-trackable-capturing
squotShadowFactory
	^ self class isImmediateClass
		ifTrue: [SquotPrimitiveValue]
		ifFalse: [SquotObjectShadow]