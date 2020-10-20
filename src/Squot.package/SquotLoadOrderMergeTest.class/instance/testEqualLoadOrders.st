tests
testEqualLoadOrders
	| merge |
	merge := SquotLoadOrderMerge into: #('a' 'b' 'c') merge: #('a' 'b' 'c') basedOn: #('a' 'b' 'c').
	self deny: merge hasConflicts;
		deny: merge hasChanges.