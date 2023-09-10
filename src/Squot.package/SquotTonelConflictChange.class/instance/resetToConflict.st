resolving
resetToConflict
	self text: self mergeStrings.
	self isResolved: false.
	self resolution: nil.