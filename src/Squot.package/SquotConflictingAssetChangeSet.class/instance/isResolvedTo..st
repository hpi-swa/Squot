accessing
isResolvedTo: anObject
	^ self isResolved and: [self resolution squotEqual: anObject].