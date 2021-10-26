testing
testReplacedObject
	| holder1 holder2 diff graphAfter graphBefore |
	holder1 := ValueHolder new contents: (Smalltalk globals bindingOf: #Object); yourself.
	holder2 := ValueHolder new contents: (Smalltalk globals bindingOf: #SmallInteger); yourself.
	graphBefore := capturer captureGraph: holder1.
	objectRegistry assign: (objectRegistry nameOf: holder1) to: holder2.
	graphAfter := capturer captureGraph: holder2.
	diff := graphBefore squotDiffAgainst: graphAfter.
	"when"
	self apply: diff to: holder1.
	"then"
	self assert: holder1 contents == holder2 contents.