test objects
hasChangesAt: path in: merge
	^ (merge includesModificationAt: path) and: [(merge at: path) hasChanges]