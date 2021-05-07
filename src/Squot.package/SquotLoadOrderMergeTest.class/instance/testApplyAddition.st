tests
testApplyAddition
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'b') merge: #('a' 'c' 'b') basedOn: #('a' 'b').
	merge applyDiff: (SquotArtifactAddition of: (SquotArtifactMock path: 'c')).
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('a' 'c' 'b') equals: (merge resolvedPatch applyTo: #('a' 'b')). "Must remember the place of the new artifact."
	