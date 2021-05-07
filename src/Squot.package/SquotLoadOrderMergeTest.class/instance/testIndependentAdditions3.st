tests
testIndependentAdditions3
	| merge |
	merge := SquotLoadOrderMerge into: #('x' 'a') merge: #('x' 'b') basedOn: #('x').
	"Since neither a depends on b nor the other way around, the order does not matter."
	self assert: merge hasChanges;
		deny: merge hasConflicts.
	merge applyDiff: (SquotArtifactAddition of: (SquotArtifactMock path: 'b')).
	self assert: #('x' 'b' 'a') asBag equals: (merge resolvedPatch applyTo: #('x' 'a')) asBag.