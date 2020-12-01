tests
testApplyRemoval
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'b' 'c') merge: #('a' 'c') basedOn: #('a' 'b' 'c').
	merge applyDiff: (SquotArtifactRemoval of: (SquotArtifactMock path: 'b')).
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('a' 'c') equals: (merge resolvedPatch applyTo: #('a' 'b' 'c')).