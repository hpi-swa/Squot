merging
resetToConflict
	self texts: self mergeSources.
	self isResolved: false.
	self resolution: nil.