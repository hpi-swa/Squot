diffing low-level
addedObject: aShadow withName: name
	name ifNotNil: [graphDiff addShadow: aShadow named: name].
	self addToBeVisitedLeft: nil right: aShadow.