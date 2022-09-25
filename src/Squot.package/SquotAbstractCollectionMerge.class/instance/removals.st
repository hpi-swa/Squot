accessing
removals
	^ (containerModifications select: [:each | each isRemoval]), (containerConflicts select: [:each | each isResolved and: [each resolution isRemoval]] thenCollect: [:each | each resolution])