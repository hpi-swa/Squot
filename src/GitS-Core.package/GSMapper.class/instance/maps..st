testing
maps: aPath
	^ self mappedPathPatterns anySatisfy: [:each | each matches: aPath]