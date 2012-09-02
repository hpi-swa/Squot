initialize-release
initializeWith: aRepository with: aCache for: aRevision
	hasChanges := false.
	repository := aRepository.
	cache := aCache.
	treeMap := Dictionary new.
	createdPaths := Dictionary new.
	deletedPaths := Dictionary new.
	treeMap
		at: Path root
		put: (aRevision
			ifNotNil: [ self newTreeFrom: aRevision tree ]
			ifNil: [ self newTreeAt: Path root ])