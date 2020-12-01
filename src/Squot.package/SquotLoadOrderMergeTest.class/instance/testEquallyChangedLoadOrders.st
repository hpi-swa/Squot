tests
testEquallyChangedLoadOrders
	| merge |
	merge := SquotLoadOrderMerge into: #('b' 'a' 'c') merge: #('b' 'a' 'c') basedOn: #('a' 'b' 'c').
	self deny: merge hasConflicts;
		deny: merge hasChanges.