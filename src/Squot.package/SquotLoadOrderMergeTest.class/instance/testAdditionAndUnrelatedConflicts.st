tests
testAdditionAndUnrelatedConflicts
	| merge |
	merge := SquotLoadOrderMerge into: #('0' '<' '>') merge: #('<' 'x' '>' '0') basedOn: #('<' '0' '>').
	"Moves of 0 conflict with each other, position of x should be clear."
	self assert: merge hasChanges;
		assert: merge hasConflicts.
	merge
		chooseIncoming;
		applyDiff: (SquotArtifactAddition of: (SquotArtifactMock path: 'x')).
	self assert: merge hasChanges;
		deny: merge hasConflicts;
		assert: #('<' 'x' '>' '0') equals: (merge resolvedPatch applyTo: #('0' '<' '>')).
	merge chooseWorking.
	self deny: merge hasConflicts;
		assert:  #('0' '<' 'x' '>') equals: (merge resolvedPatch applyTo: #('0' '<' '>')).