initialize-release
initializeWith: aRepository with: aCache for: aRevision
	super initialize.
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
			ifNil: [ self newTreeAt: FSPath root ])