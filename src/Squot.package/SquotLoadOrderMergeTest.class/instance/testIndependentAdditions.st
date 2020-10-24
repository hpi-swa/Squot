tests
testIndependentAdditions
	| merge |
	merge := SquotLoadOrderMerge into: #('a') merge: #('b') basedOn: #().
	"Since neither a depends on b nor the other way around, the order does not matter."
	self assert: merge hasChanges;
		deny: merge hasConflicts.
	merge applyDiff: (SquotArtifactAddition of: (SquotArtifactMock path: 'b')).
	self assert: #('b' 'a') asBag equals: (merge resolvedPatch applyTo: #('a')) asBag.