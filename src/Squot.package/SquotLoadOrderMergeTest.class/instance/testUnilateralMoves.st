tests
testUnilateralMoves
	| merge |
	merge := SquotLoadOrderMerge into: #('c' 'a' 'b') merge: #('a' 'b' 'c') basedOn: #('a' 'b' 'c').
	self deny: merge hasConflicts;
		assert: #('c' 'a' 'b') equals: (merge resolvedPatch applyTo: #('c' 'a' 'b')).
	merge := SquotLoadOrderMerge into: #('a' 'b' 'c') merge: #('c' 'a' 'b') basedOn: #('a' 'b' 'c').
	self deny: merge hasConflicts;
		assert: #('c' 'a' 'b') equals: (merge resolvedPatch applyTo: #('a' 'b' 'c')).