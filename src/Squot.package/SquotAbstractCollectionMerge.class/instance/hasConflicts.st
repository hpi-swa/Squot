testing
hasConflicts
	^ (self containerConflicts anySatisfy: [:each | each isResolved not])
		or: [self elementMerges anySatisfy: [:each | each hasConflicts]]