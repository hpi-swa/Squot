test objects
hasChangesAt: path in: patch
	^ (patch includesDiffAt: path) and: [(patch diffAt: path) hasChanges]