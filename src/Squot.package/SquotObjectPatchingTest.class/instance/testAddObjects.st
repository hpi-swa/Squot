testing
testAddObjects
	| a b graphA graphB diff |
	a := ValueHolder new contents: nil.
	b := ValueHolder new contents: (ValueHolder new contents: 1).
	graphA := capturer captureGraph: a.
	objectRegistry assign: (objectRegistry nameOf: a) to: b.
	graphB := capturer captureGraph: b.
	diff := graphA squotDiffAgainst: graphB.
	self apply: diff to: a.
	self assert: a contents class == ValueHolder.
	self assert: a contents contents == 1.