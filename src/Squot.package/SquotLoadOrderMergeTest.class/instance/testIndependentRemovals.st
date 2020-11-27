tests
testIndependentRemovals
	| merge |
	merge := SquotLoadOrderMerge into: #('a') merge: #('b') basedOn: #('a' 'b').
	self assert: merge hasChanges;
		deny: merge hasConflicts.
	merge applyDiff: (SquotArtifactRemoval of: (SquotArtifactMock path: 'a')).
	self assert: #() equals: (merge resolvedPatch applyTo: #('a')).