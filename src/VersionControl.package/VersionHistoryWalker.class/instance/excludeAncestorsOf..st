history walking
excludeAncestorsOf: aVersion
	searchFrontier add: (self marked: aVersion) markReachableFromSink; yourself.