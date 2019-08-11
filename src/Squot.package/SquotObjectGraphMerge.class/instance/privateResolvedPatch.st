private
privateResolvedPatch
	containerConflicts do:
		[:each |
		diffs addDiff: each resolution
			forObjectNamed: (self keyOf: each resolution object)].
	containerModifications do: 
		[:each |
		diffs addDiff: each
			forObjectNamed: (self keyOf: each object)].
	elementMerges do:
		[:each |
		diffs addDiff: each resolvedPatch
			forObjectNamed: (self keyOf: each object)].
	^ diffs