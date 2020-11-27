tests
testApplyModificationDoesNothing
	| merge left right |
	merge := SquotLoadOrderMerge into: #('a' 'b' 'c') merge: #('a' 'b' 'c') basedOn: #('a' 'b' 'c').
	left := SquotArtifactMock path: 'b'.
	right := left copy.
	left 	whenContentComparedWith: right return: [SquotDiffMock new].
	merge applyDiff: (SquotArtifactModification left: left right: right).
	self deny: merge hasConflicts;
		assert: #('a' 'b' 'c') equals: (merge resolvedPatch applyTo: #('a' 'b' 'c')).