accessing
additions
	^ (containerModifications select: [:each | each isAddition]), (containerConflicts select: [:each | each isResolved and: [each resolution isAddition]] thenCollect: [:each | each resolution])