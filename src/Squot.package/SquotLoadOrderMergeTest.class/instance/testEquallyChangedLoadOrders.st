tests
testEquallyChangedLoadOrders
	| merge |
	merge := SquotLoadOrderMerge into: #('b' 'a' 'c') merge: #('b' 'a' 'c') basedOn: #('a' 'b' 'c').
	self deny: merge hasConflicts;
		assert: #('b' 'a' 'c') equals: (merge resolvedPatch applyTo: #('b' 'a' 'c')).