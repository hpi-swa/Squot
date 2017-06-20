*Squot-trackable
squotShadowFactory
	^ self class isImmediateClass
		ifTrue: [SquotPrimitiveValue]
		ifFalse: [SquotObjectShadow]