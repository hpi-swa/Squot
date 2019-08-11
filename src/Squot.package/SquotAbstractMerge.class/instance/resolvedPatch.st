merging
resolvedPatch
	self hasConflicts ifTrue: [self error: 'Conflicts not resolved'].
	^ self privateResolvedPatch