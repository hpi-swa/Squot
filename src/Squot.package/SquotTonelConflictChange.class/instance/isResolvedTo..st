accessing
isResolvedTo: aCollection
	^ self isResolved and: [self resolutionSources = aCollection]