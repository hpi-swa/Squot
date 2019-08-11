testing
hasConflicts
	^ self conflicts anySatisfy: [:each | each isResolved not]