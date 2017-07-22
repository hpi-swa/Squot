testing
testCyclicReferences
	| array original target |
	array := Array new: 2.
	array
		at: 1 put: array;
		at: 2 put: 2.
	original := capturer capture: array.
	array at: 2 put: 3.
	target := capturer capture: array.
	"make up a new working copy"
	array := SquotShadowMaterializer new rematerialize: original startShadow.
	self assert: 2 equals: (array at: 2).
	self patch: array to: target startObject.
	self assert: (array at: 1) == array.
	self assert: 3 equals: (array at: 2).