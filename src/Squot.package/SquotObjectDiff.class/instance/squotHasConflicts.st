Squot-diff-testing
squotHasConflicts
	self deprecated: 'Should use a SquotObjectMerge instead'.
	^ slotChanges anySatisfy: [:any | any hasConflicts]