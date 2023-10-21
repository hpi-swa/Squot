paths
isUnmappedPath: aPath
	^ self mappedPaths noneSatisfy: [:each |
		SquotPathUtilities path: aPath collidesWith: each]