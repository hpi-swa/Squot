testing
testDeepChanges2
	| a b diff diffA |
	a := ValueHolder new contents: (b := ValueHolder new contents: 1).
	diff := self diff: a againstItselfAfter: [b contents: 2].
	self assert: diff squotHasChanges.
	diffA := diff diffForObjectNamed: (objectRegistry nameOf: a)
		ifAbsent: [self fail: 'Should have a diff for a because of deep changes'].
	self assert: diffA squotHasChanges.