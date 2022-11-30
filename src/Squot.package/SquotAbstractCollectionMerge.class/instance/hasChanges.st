testing
hasChanges
	^ (containerConflicts anySatisfy: [:each | each hasChanges]) or:
		[(containerModifications anySatisfy: [:each | each squotHasChanges]) or:
			[elementMerges anySatisfy: [:each | each hasChanges]]]