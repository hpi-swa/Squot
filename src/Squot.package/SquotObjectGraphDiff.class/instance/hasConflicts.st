testing
hasConflicts
	self deprecated: 'Should use a SquotObjectGraphMerge instead'.
	^ diffs anySatisfy: [:any | any squotHasConflicts]