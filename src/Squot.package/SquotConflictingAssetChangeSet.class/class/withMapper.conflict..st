instance creation
withMapper: aMapper conflict: aMergeConflict
	^ self
		withMapper: aMapper
		left: aMergeConflict left
		right: aMergeConflict right
		base: aMergeConflict base