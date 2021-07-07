testing
testRemoveComplexValueObject
	| a b graphBefore graphAfter diff removedItem |
	"given"
	a := Set newFrom: {1. (removedItem := {2. {3}. 4})}.
	b := Set newFrom: {1}.
	graphBefore := capturer captureGraph: a.
	objectRegistry assign: (objectRegistry nameOf: a) to: b.
	graphAfter := capturer captureGraph: b.
	diff := graphBefore squotDiffAgainst: graphAfter.
	"when"
	self apply: diff to: a.
	"then"
	self assert: (a includes: 1).
	self deny: (a includes: removedItem).