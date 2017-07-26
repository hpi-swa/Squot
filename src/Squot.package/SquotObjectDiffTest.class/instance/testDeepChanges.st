testing
testDeepChanges
	| a b diff diffA |
	a := Array with: (b := Array with: 1).
	diff := self diff: a againstItselfAfter: [b at: 1 put: 2].
	self assert: diff squotHasChanges.
	diffA := diff diffForObjectNamed: (objectRegistry nameOf: a)
		ifAbsent: [self fail: 'Should have a diff for a because of deep changes'].
	self assert: diffA squotHasChanges.