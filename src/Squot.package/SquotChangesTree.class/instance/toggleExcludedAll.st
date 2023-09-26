excluding
toggleExcludedAll
	self allExcluded
		ifTrue: [self includeAll]
		ifFalse: [self excludeAll].