accessing
removals
	| properRemovals acceptedRemovals resolvedAdditionConflicts |
	properRemovals := containerModifications select: [:each | each isRemoval].
	acceptedRemovals := containerConflicts select: [:each | each isResolved and: [each resolution isRemoval]] thenCollect: [:each | each resolution].
	resolvedAdditionConflicts := containerConflicts select: [:each | each isResolved and: [each resolution isModification]] thenCollect: [:each | SquotArtifactRemoval of: each resolution left artifact].
	^properRemovals, acceptedRemovals, resolvedAdditionConflicts