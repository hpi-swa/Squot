testing
testAddObjects
	| object newObject newLoadedGraph |
	object := ValueHolder new contents: nil.
	newLoadedGraph := self patchedCopyOf: object toReproduce:
		[object contents: (ValueHolder new contents: 1)].
	newObject := newLoadedGraph startObject.
	self assert: newObject contents class == ValueHolder.
	self assert: newObject contents contents == 1.