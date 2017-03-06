initialize-release
initializeWith: aRepository with: aCache for: aRevision
	hasChanges := false.
	repository := aRepository.
	cache := aCache.
	treeMap := Dictionary new.
	createdPaths := Dictionary new.
	deletedPaths := Dictionary new.
	treeMap
		at: FSPath root
		put: (aRevision
			ifNotNil: [ self newTreeFrom: aRevision tree ]
			ifNil: [ self newTreeAt: FSPath root ]).
	pendingPathsForEntryUpdate := Heap sortBlock: [:a :b |
		a size > b size
		or: [a size = b size
			and: [(a parent printWithDelimiter: $/) >= (b parent printWithDelimiter: $/)]]].