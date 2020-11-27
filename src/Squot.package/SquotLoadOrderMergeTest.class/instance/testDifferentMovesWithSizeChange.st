tests
testDifferentMovesWithSizeChange
	| merge |
	merge := SquotLoadOrderMerge into: #('b' 'x' 'a' 'c') merge: #('b' 'y' 'c' 'a') basedOn: #('a' 'x' 'b' 'y' 'c').
	"Since a does not come before c anymore on one side, it cannot be a true dependency.
	Therefore resolve to b c a."
	self assert: merge hasChanges;
		deny: merge hasConflicts.
	merge applyDiff: (SquotArtifactRemoval of: (SquotArtifactMock path: 'x')). "x was unchanged or deliberately dropped."
	self assert: #('b' 'c' 'a') equals: (merge resolvedPatch applyTo: #('b' 'x' 'a' 'c')).