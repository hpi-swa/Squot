merging
squotMergeWith: incomingPrimitiveValue basedOn: basePrimitiveValue
	"There is no point in merging primitive objects. They are immutable."
	self assert: incomingPrimitiveValue = self;
		assert: basePrimitiveValue = self.
	^ SquotNoMerge of: self