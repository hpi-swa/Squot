diffing low-level
addedObject: aShadow withName: name
	graphDiff addShadow: aShadow named: name.
	self addToBeVisitedLeft: nil right: aShadow.