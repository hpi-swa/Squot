testing
testDeepChanges3
	"Try to provoke the diff builder to visit an object again only after changes to it have been detected already."
	| a b c d diff diffD |
	a := ValueHolder new
		contents: {(b := ValueHolder new contents: 1).
			(c := ValueHolder new contents: (d := ValueHolder new contents: b))}.
	diff := self diff: a againstItselfAfter: [b contents: 2].
	self assert: diff squotHasChanges.
	diffD := diff diffForObjectNamed: (objectRegistry nameOf: c)
		ifAbsent: [self fail: 'Should have a diff for a because of deep changes'].
	self assert: diffD squotHasChanges.