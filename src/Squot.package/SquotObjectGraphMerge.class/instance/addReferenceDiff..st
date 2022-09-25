adding and removing
addReferenceDiff: aSquotReferenceTargetExchange 
	self assert: aSquotReferenceTargetExchange reference = SquotObjectGraphRootReference new.
	containerModifications at: (self keyOf: aSquotReferenceTargetExchange object) put: aSquotReferenceTargetExchange.