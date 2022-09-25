accessing
updateResult
	| patcher |
	patcher := working monticelloPatcher.
	(containerConflicts select: [:each | each isResolved]) do: [:each | each applyTo: patcher].
	containerModifications do: [:each | each applyTo: patcher].
	result := working copyWithSnapshot: patcher patchedSnapshot.