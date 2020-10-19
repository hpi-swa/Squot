tests
testAdditionsInDifferentPlaces
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'x' 'b') merge: #('x' 'a' 'b') basedOn: #('a' 'b').
	"Cannot know whether x depends on a or a depends on x."
	self assert: merge hasChanges;
		assert: merge hasConflicts;
		assert: (merge conflictAt: 'x' ifAbsent: []) notNil.
	(merge conflictAt: 'x') chooseIncoming.
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('x' 'a' 'b') equals: (merge resolvedPatch applyTo: #('a' 'x' 'b')).
	(merge conflictAt: 'x') chooseWorking.
	self deny: merge hasConflicts;
		assert: #('a' 'x' 'b') equals: (merge resolvedPatch applyTo: #('a' 'x' 'b')).