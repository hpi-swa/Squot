testing
testAddSubgraph2
	"The subgraph is added to another object than the start object."
	| a b graphA graphB diff |
	a := ValueHolder new contents: (ValueHolder new contents: nil).
	b := ValueHolder new contents: (ValueHolder new contents: (ValueHolder new contents: (ValueHolder new contents: 1))).
	graphA := capturer captureGraph: a.
	objectRegistry assign: (objectRegistry nameOf: a) to: b;
		assign: (objectRegistry nameOf: a contents) to: b contents.
	graphB := capturer captureGraph: b.
	diff := graphA squotDiffAgainst: graphB.
	self apply: diff to: a.
	self assert: a contents contents "first new value holder" contents "second new value holder" contents = 1;
		deny: a contents contents == b contents contents. "Should be a new object"