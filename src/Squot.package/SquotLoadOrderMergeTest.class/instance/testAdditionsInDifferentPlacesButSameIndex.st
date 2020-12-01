tests
testAdditionsInDifferentPlacesButSameIndex
	| merge |
	merge := SquotLoadOrderMerge into: #('b' 'x') merge: #('a' 'x' 'b') basedOn: #('a' 'b').
	"Cannot know whether x depends on b or b depends on x."
	self assert: merge hasChanges;
		assert: merge hasConflicts.
	merge chooseIncoming.
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('x' 'b') equals: (merge resolvedPatch applyTo: #('b' 'x')).
	merge chooseWorking.
	self deny: merge hasConflicts;
		deny: merge resolvedPatch squotHasChanges.