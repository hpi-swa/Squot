accessing
updateResult
	| mirror |
	self flag: #todo. "We may not have the correct mirror here if the owners of this object view it differently."
	mirror := working class squotMirror.
	result := working copy.
	self assert: elementMerges isEmpty.
	containerModifications do: [:each | each asSlotDiff applyTo: result].
	self flag: #todo. "Should not rely on old classes (slot diffs)"
	containerConflicts do: [:each | each resolution squotReflectOn: result in: mirror].