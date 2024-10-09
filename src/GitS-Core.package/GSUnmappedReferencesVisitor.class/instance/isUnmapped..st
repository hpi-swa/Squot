accessing
isUnmapped: aPath
	^ self mappedPathPatterns noneSatisfy: [:each | each matches: aPath]