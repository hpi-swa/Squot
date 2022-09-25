tests
testAddObjects
	| merge object newObject |
	object := ValueHolder new contents: nil.
	merge := self mergeOf: object withChanges: [object contents: (newObject := ValueHolder new contents: 1)].
	self assert: merge hasChanges;
		assert: (merge additions anySatisfy: [:each | (merge incoming nameOf: each object) = (objectRegistry nameOf: newObject)]).