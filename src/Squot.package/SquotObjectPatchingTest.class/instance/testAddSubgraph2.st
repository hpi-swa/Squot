testing
testAddSubgraph2
	"The subgraph is added to another object than the start object."
	| object patched |
	object := ValueHolder new contents: (ValueHolder new contents: nil).
	patched := self patchedCopyOf: object toReproduce:
		[object contents contents: (ValueHolder new contents: (ValueHolder new contents: 1))].
	self assert: patched startObject contents contents "first new value holder" contents "second new value holder" contents = 1.