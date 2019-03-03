converting
setUpTreeRoot: aDiffNode toEditPatch: aPatchBuilder
	aDiffNode
		includeBlock: [aPatchBuilder addDiff: self rightDiff];
		excludeBlock: [aPatchBuilder addDiff: self leftDiff];
		resetBlock: [aPatchBuilder addDiff: self].