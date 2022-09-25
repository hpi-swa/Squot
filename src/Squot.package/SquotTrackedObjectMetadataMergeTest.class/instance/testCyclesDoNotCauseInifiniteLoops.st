tests
testCyclesDoNotCauseInifiniteLoops
	"Even though every object is treated as a value object, cycles should not cause infinite loops."
	| m1 m2 array diff new |
	array := Array new: 1.
	array at: 1 put: array.
	m1 := SquotTrackedObjectMetadata newFrom: {#complex -> array}.
	m2 := SquotTrackedObjectMetadata newFrom: {#complex -> array}.
	"when"
	new := (diff := (m1 squotMergeWith: m2 basedOn: m1) resolvedPatch) squotApplyTo: m1.
	"then"
	self assert: (new at: #complex) == (new at: #complex) contents. "Not changed"