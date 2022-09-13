tests
revertVersionAddedAtEndOfHistory
	^ (self workingCopy loadedVersion parents hasEqualElements: {versionA2})
		and: [self workingCopy loadedVersion message beginsWith: 'Revert']