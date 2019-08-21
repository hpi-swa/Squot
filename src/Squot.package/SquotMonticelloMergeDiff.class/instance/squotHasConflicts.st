testing
squotHasConflicts
	^ conflicts anySatisfy: [:each | each isResolved not]