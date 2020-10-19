testing
hasChanges
	^ containerConflicts notEmpty or: [(resolvedPatch ifNil: [self resolvedPatch]) squotHasChanges]