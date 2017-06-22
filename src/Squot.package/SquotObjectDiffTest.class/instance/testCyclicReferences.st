testing
testCyclicReferences
	| subject diff |
	subject := Array new: 1.
	subject at: 1 put: subject.
	self assertDiffAgainstItselfHasNoChanges: subject.
	diff := self diff: subject againstItselfAfter:
		[subject at: 1 put: {subject}].
	self assert: diff squotHasChanges.
	self flag: 'TODO: assert something about the introduced indirection and thus longer cycle'.