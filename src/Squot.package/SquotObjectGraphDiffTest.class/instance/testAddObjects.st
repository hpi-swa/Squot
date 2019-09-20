tests
testAddObjects
	| diff object newObject |
	object := ValueHolder new contents: nil.
	diff := self diff: object againstItselfAfter: [object contents: (newObject := ValueHolder new contents: 1)].
	self assert: diff squotHasChanges;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: newObject)) isAddition.