private
privateResolvedPatch
	| modifiedIncoming |
	modifiedIncoming := incoming copy.
	containerModifications do: [:each | each applyTo: modifiedIncoming].
	^ working squotDiffAgainst: modifiedIncoming