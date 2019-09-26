private
privateResolvedPatch
	| patcher |
	patcher := working monticelloPatcher.
	containerConflicts do: [:each | each applyTo: patcher].
	containerModifications do: [:each | each applyTo: patcher].
	^ working diffToSnapshot: patcher patchedSnapshot