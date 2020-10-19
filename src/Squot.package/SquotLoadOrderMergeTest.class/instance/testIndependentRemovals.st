tests
testIndependentRemovals
	| merge |
	merge := SquotLoadOrderMerge into: #('a') merge: #('b') basedOn: #('a' 'b').
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #() equals: (merge resolvedPatch applyTo: #('a')).