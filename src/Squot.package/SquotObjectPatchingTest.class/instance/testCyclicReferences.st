testing
testCyclicReferences
	| array original target materializer |
	array := Array new: 2.
	array
		at: 1 put: array;
		at: 2 put: 2.
	original := capturer captureGraph: array.
	array at: 2 put: 3.
	target := capturer captureGraph: array.
	"make up a new working copy"
	materializer := SquotShadowMaterializer new.
	materializer sourceGraph: original.
	materializer targetGraph: original asShadowGraph mutableCopy.
	array := materializer rematerialize: original startShadow.
	self assert: (array at: 1) == array.
	self assert: 2 equals: (array at: 2).
	self patch: array to: target startObject.
	self assert: (array at: 1) == array.
	self assert: 3 equals: (array at: 2).