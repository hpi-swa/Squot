tests
testMultipleConflicts
	| merge |
	merge := SquotLoadOrderMerge into: #('0' '<' 'x' 'a' 'b' '>') merge: #('<' 'b' 'a' 'x' '>' '0') basedOn: #('<' '0' 'a' 'b' '>').
	"Moves of 0 conflict with each other, conflict about position of new x."
	self assert: merge hasChanges;
		assert: merge hasConflicts.
	merge chooseIncoming.
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('<' 'b' 'a' 'x' '>' '0') equals: (merge resolvedPatch applyTo: #('0' '<' 'x' 'a' 'b' '>')).
	merge chooseWorking.
	self deny: merge hasConflicts;
		deny: merge resolvedPatch squotHasChanges.