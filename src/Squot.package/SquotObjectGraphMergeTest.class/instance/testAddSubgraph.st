tests
testAddSubgraph
	| merge object newObject |
	object := ValueHolder new contents: nil.
	merge := self mergeOf: object withChanges: [object contents: (newObject := ValueHolder new contents: 'this is new as well')].
	self assert: merge hasChanges;
		assert: (merge additions anySatisfy: [:each | (merge incoming nameOf: each object) = (objectRegistry nameOf: newObject contents)]).