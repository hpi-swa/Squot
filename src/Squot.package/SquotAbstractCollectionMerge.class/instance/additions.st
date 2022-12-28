accessing
additions
	| properAdditions undoneRemovals resolvedAdditionConflicts |
	properAdditions := containerModifications select: [:each | each isAddition].
	undoneRemovals := containerConflicts select: [:each | each isResolved and: [each resolution isAddition]] thenCollect: [:each | each resolution].
	resolvedAdditionConflicts := containerConflicts select: [:each | each isResolved and: [each resolution isModification]] thenCollect: [:each | SquotArtifactAddition of: each resolution right artifact].
	^ properAdditions, undoneRemovals, resolvedAdditionConflicts