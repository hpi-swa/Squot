testing
testSet
	| a b sh graphBefore graphAfter diff removedItem |
	"given"
	a := Set newFrom: {1. 'foo'. (sh := StringHolder new contents: 'old')}.
	b := Set newFrom: {1. 'bar'. StringHolder new contents: 'new'}.
	graphBefore := capturer captureGraph: a.
	objectRegistry assign: (objectRegistry nameOf: a) to: b;
		assign: (objectRegistry nameOf: sh) to: (b detect: [:each | each class = StringHolder]).
	graphAfter := capturer captureGraph: b.
	diff := graphBefore squotDiffAgainst: graphAfter.
	removedItem := a detect: [:each | each = 'foo'].
	"when"
	self apply: diff to: a.
	"then"
	self assert: (a includes: 1).
	self assert: (a includes: 'bar').
	self deny: (a includes: removedItem).
	self assert: 'new' equals: sh contents;
		assert: (a includes: sh).