testing
hasChanges
	^ (diffs anySatisfy: [:each | each hasChanges]) or: [self hasLoadOrderChanges]