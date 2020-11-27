tests
testApplyAdditionAfterConflict
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'c') "had b removed" merge: #('a' 'b' 'c') "with b changed" basedOn: #('a' 'b' 'c').
	merge applyDiff: (SquotArtifactAddition of: (SquotArtifactMock path: 'b')). "as conflict resolution"
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('a' 'b' 'c') equals: (merge resolvedPatch applyTo: #('a' 'c')). "Must remember the place of the new artifact."
	