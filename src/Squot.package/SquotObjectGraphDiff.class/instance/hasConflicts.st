testing
hasConflicts
	^ diffs anySatisfy: [:any | any squotHasConflicts]