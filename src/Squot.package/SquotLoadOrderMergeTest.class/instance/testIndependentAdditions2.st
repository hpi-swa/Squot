tests
testIndependentAdditions2
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'x') merge: #('b' 'x') basedOn: #('x').
	"Since neither a depends on b nor the other way around, the order does not matter."
	self assert: merge hasChanges;
		deny: merge hasConflicts.
	merge applyDiff: (SquotArtifactAddition of: (SquotArtifactMock path: 'b')).
	self assert: #('b' 'a' 'x') asBag equals: (merge resolvedPatch applyTo: #('a' 'x')) asBag.