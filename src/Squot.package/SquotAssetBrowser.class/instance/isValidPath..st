paths
isValidPath: aPath
	^ self paths noneSatisfy: [:each |
		each = aPath or: [aPath containsPath: each]]