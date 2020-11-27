tests
testAdditionAndUnrelatedConflicts2
	| merge |
	merge := SquotLoadOrderMerge into: #('0' '<' 'x' '>') merge: #('<' '>' '0') basedOn: #('<' '0' '>').
	"Moves of 0 conflict with each other."
	self assert: merge hasChanges;
		assert: merge hasConflicts.
	merge chooseIncoming. "But do not remove x."
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('<' '>' '0' 'x') equals: (merge resolvedPatch applyTo: #('0' '<' 'x' '>')).
		"Because according to the original position of x, it might depend on 0."
	merge chooseWorking.
	self deny: merge hasConflicts;
		assert:  #('0' '<' 'x' '>') equals: (merge resolvedPatch applyTo: #('0' '<' 'x' '>')).