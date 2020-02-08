history walking
excludeAncestorsOf: aVersion
	sinkVersions add: aVersion.
	searchFrontier add: ((self marked: aVersion) markReachableFromSink; yourself).