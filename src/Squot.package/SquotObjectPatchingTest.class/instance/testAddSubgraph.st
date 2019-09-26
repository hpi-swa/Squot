testing
testAddSubgraph
	"New objects contained by other new objects must be materialized as well."
	| object patched |
	object := ValueHolder new contents: nil.
	patched := self patchedCopyOf: object toReproduce:
		[object contents: (ValueHolder new contents: (ValueHolder new contents: 1))].
	self assert: patched startObject contents "first new value holder" contents "second new value holder" contents = 1.