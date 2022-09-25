capturing
shadowFactory
	"Answer an object factory (e. g. a class) that can create snapshots of my reflected objects."
	^ class isImmediateClass
		ifTrue: [SquotPrimitiveValue]
		ifFalse: [SquotValueObjectShadow]