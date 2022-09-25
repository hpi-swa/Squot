accessing
modifications
	^ (containerModifications select: [:each | each isModification]), (containerConflicts values select: [:each | each isResolved and: [each resolution isModification]] thenCollect: [:each | each resolution])