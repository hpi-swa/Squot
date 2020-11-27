test objects
hasChangesAt: path in: merge
	^ (merge includesModificationAt: merge) and: [(merge at: path) hasChanges]