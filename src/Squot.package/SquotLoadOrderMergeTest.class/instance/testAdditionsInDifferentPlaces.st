tests
testAdditionsInDifferentPlaces
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'x' 'b') merge: #('x' 'a' 'b') basedOn: #('a' 'b').
	"Cannot know whether x depends on a or a depends on x."
	self assert: merge hasChanges;
		assert: merge hasConflicts.
	merge chooseIncoming.
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('x' 'a' 'b') equals: (merge resolvedPatch applyTo: #('a' 'x' 'b')).
	merge chooseWorking.
	self deny: merge hasConflicts;
		deny: merge resolvedPatch squotHasChanges.