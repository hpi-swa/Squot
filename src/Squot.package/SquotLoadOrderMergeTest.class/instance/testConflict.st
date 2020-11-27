tests
testConflict
	| merge |
	merge := SquotLoadOrderMerge into: #('0' '<' '>') merge: #('<' '>' '0') basedOn: #('<' '0' '>').
	"Moves of 0 conflict with each other."
	self assert: merge hasChanges;
		assert: merge hasConflicts.
	merge chooseIncoming.
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('<' '>' '0') equals: (merge resolvedPatch applyTo: #('0' '<' '>')).
	merge chooseWorking.
	self deny: merge hasConflicts;
		deny: merge resolvedPatch squotHasChanges.