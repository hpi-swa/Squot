testing
testCyclicReferences
	| array original target newGraph newArray |
	array := Array new: 2.
	array
		at: 1 put: array;
		at: 2 put: 2.
	original := capturer captureGraph: array.
	array at: 2 put: 3.
	target := capturer captureGraph: array.
	newGraph := self rematerializeAsNewGraph: original.
	newArray := newGraph startObject.
	newGraph objectNames do: [:each | objectRegistry assign: each to: (newGraph objectNamed: each)].
	self assert: (newArray at: 1) == newArray.
	self assert: 2 equals: (newArray at: 2).
	"when"
	self patch: newArray to: target startObject.
	"then"
	self assert: (newArray at: 1) == newArray.
	self assert: 3 equals: (newArray at: 2).