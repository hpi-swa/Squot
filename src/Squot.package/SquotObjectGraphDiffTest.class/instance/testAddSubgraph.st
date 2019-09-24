tests
testAddSubgraph
	| diff object newObject |
	object := ValueHolder new contents: nil.
	diff := self diff: object againstItselfAfter:
		[object contents: (newObject := ValueHolder new contents: 'this is new as well')].
	self assert: (diff diffForObjectNamed: (objectRegistry nameOf: newObject contents)) isAddition.