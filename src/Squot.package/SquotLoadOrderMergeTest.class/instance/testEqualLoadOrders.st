tests
testEqualLoadOrders
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'b' 'c') merge: #('a' 'b' 'c') basedOn: #('a' 'b' 'c').
	self deny: merge hasConflicts;
		assert: #('a' 'b' 'c') equals: (merge resolvedPatch applyTo: #('a' 'b' 'c')).