testing
testAddSubgraph
	"New objects contained by other new objects must be materialized as well."
	| a b diff graphA graphB |
	a := ValueHolder new contents: nil.
	b := ValueHolder new contents: (ValueHolder new contents: (ValueHolder new contents: 1)).
	graphA := capturer captureGraph: a.
	objectRegistry assign: (objectRegistry nameOf: a) to: b.
	graphB := capturer captureGraph: b.
	diff := graphA squotDiffAgainst: graphB.
	self apply: diff to: a.
	self assert: a contents "first new value holder" contents "second new value holder" contents = 1.
	self deny: a contents == b contents. "Should be a new object"