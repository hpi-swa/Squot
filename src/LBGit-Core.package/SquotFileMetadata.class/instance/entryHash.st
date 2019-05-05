accessing
entryHash

	^ self treeEntry 
		ifNil: [nil]
		ifNotNil: [self treeEntry entryHash]