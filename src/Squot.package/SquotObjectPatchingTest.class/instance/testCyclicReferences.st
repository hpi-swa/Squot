testing
testCyclicReferences
	| array original target diff |
	array := Array new: 2.
	array
		at: 1 put: array;
		at: 2 put: 2.
	original := capturer captureGraph: array.
	array at: 2 put: 3.
	target := capturer captureGraph: array.
	"Cannot use become: with two different self-referencing arrays because it would mix them. 1->2->1->2->..."
	array at: 2 put: 2.
	self assert: (original startObject at: 1) == array.
	self assert: 2 equals: (original startObject at: 2).
	"when"
	diff := original squotDiffAgainst: target.
	patcher apply: diff toLoadedGraph: original mutableCopy.
	"then"
	self assert: (array at: 1) == array.
	self assert: 3 equals: (array at: 2).