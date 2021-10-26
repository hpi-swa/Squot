testing
testAddObjectThatRefersToExisting
	"Existing objects referenced by new objects should not be duplicated just because the 
	new objects are created new."
	| a b existing new diff graphA graphB |
	a := Array with: (existing := ValueHolder new) with: nil.
	b := Array with: existing with: (new := ValueHolder new contents: existing).
	graphA := capturer captureGraph: a.
	objectRegistry assign: (objectRegistry nameOf: a) to: b.
	graphB := capturer captureGraph: b.
	diff := graphA squotDiffAgainst: graphB.
	self apply: diff to: a.
	self assert: (a at: 1) == (a at: 2) contents;
		deny: (a at: 2) == (b at: 2). "Should be a new object"