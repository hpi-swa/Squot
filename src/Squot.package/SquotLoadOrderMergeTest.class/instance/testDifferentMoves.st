tests
testDifferentMoves
	| merge |
	merge := SquotLoadOrderMerge into: #('b' 'a' 'c') merge: #('b' 'c' 'a') basedOn: #('a' 'b' 'c').
	"Since a does not come before c anymore on one side, it cannot be a true dependency.
	Therefore resolve to b c a."
	self deny: merge hasConflicts;
		assert: #('b' 'c' 'a') equals: (merge resolvedPatch applyTo: #('b' 'a' 'c')).