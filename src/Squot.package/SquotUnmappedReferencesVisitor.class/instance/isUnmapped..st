accessing
isUnmapped: aPath
	^ self mappedPaths noneSatisfy: [:each |
		SquotPathUtilities path: each containsOrEquals: aPath]