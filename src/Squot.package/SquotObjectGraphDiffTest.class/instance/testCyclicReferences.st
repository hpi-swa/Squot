tests
testCyclicReferences
	| subject diff subjectDiff itemShadow |
	subject := Array new: 1.
	subject at: 1 put: subject.
	self assertDiffAgainstItselfHasNoChanges: subject.
	diff := self diff: subject againstItselfAfter:
		[subject at: 1 put: {subject}].
	self assert: diff squotHasChanges.
	subjectDiff := diff diffForObjectNamed: (objectRegistry nameOf: subject).
	itemShadow := (subjectDiff slotChanges associationAt: 1) replacementShadow.
	self assert: itemShadow name = (objectRegistry nameOf: (subject at: 1)).
	self assert: (itemShadow slots at: 1) name = (objectRegistry nameOf: subject).
	self assert: ((itemShadow slots at: 1) slots at: 1) == itemShadow.