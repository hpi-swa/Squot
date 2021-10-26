testing
testCyclicReferences2
	| array1 array2 original target diff |
	array1 := Array new: 2.
	array2 := Array new: 2.
	array1
		at: 1 put: array2;
		at: 2 put: 2.
	array2
		at: 1 put: 1;
		at: 2 put: array1.
	original := capturer captureGraph: array1.
	array1 at: 2 put: 3.
	array2 at: 1 put: 4.
	target := capturer captureGraph: array1.
	"Cannot use become: with two different self-referencing arrays because it would mix them. 1->2->1->2->..."
	array1 at: 2 put: 2.
	array2 at: 1 put: 1.
	self assert: (original startObject at: 1) == array2;
		assert: ((original startObject at: 1) at: 2) == array1.
	self assert: 2 equals: (original startObject at: 2);
		assert: 1 equals: ((original startObject at: 1) at: 1).
	"when"
	diff := original squotDiffAgainst: target.
	patcher apply: diff toLoadedGraph: original mutableCopy.
	"then"
	self assert: (array1 at: 1) == array2;
		assert: (array2 at: 2) == array1.
	self assert: 3 equals: (array1 at: 2);
		assert: 4 equals: (array2 at: 1).