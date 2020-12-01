*Squot-Tests-Tools
setUpTreeRoot: aDiffNode toEditPatch: aPatchBuilder
	aDiffNode
		includeBlock: [aPatchBuilder addDiff: self];
		excludeBlock: [aPatchBuilder resetAt: self path].