converting
resolve: aPathLike withRootAt: anotherPathLike
	^ anotherPathLike resolve: (aPathLike relativeTo: FSPath root)