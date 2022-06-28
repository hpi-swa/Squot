testing
hasChanges
	^ containerModifications notEmpty or:
		[containerConflicts anySatisfy: [:each | each isResolved not or: [each remoteChosen]]]