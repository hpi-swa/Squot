tests
xxxtestAdditionsInDifferentPlacesButSameIndex
	| merge |
	merge := SquotLoadOrderMerge into: #('b' 'x') merge: #('a' 'x' 'b') basedOn: #('a' 'b').
	"Cannot know whether x depends on b or b depends on x."
	self assert: merge hasChanges;
		assert: merge hasConflicts;
		assert: (merge conflictAt: 'x' ifAbsent: []) notNil.
	(merge conflictAt: 'x') chooseIncoming.
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('x' 'b') equals: (merge resolvedPatch applyTo: #('b' 'x')).
	(merge conflictAt: 'x') chooseWorking.
	self deny: merge hasConflicts;
		assert: #('b' 'x') equals: (merge resolvedPatch applyTo: #('b' 'x')).