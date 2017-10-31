testing
hasConflicts
	^ diffs anySatisfy: [:any | any hasConflicts]