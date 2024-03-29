private
privateResolvedPatch
	self flag: #todo. "maybe it is more consistent to copy what is the instance variable 'working', apply changes to the copy, then compute the effective diff again, but it could also be too costly"
	containerConflicts do:
		[:each |
		each resolution squotHasChanges ifTrue:
			[diffs addDiff: each resolution
				forObjectNamed: (self keyOf: each resolution object)]].
	containerModifications do: 
		[:each |
		each squotHasChanges ifTrue:
			[diffs addDiff: each
				forObjectNamed: (self keyOf: each object)]].
	elementMerges do:
		[:each | | diff |
		diff := each resolvedPatch.
		diff squotHasChanges ifTrue:
			[diffs addDiff: diff forObjectNamed: (self keyOf: each object)]].
	self assert: (base isNil or: [base startName isNil or: [base startName = working startName and: [working startName = incoming startName]]]) description: 'Object graph editions must start with the same object unless there is an addition conflict'.
	diffs startObjectName: working startName.
	diffs right: (diffs squotApplyTo: working).
	^ diffs