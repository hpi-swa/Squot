private
privateResolvedPatch
	| result |
	result := working copy.
	containerModifications do:
		[:each | result value replaceFrom: each first first to: each first last with: each third].
	containerConflicts do:
		[:each | result value replaceFrom: each first first to: each first last with: each last].
	^ working squotDiffAgainst: result