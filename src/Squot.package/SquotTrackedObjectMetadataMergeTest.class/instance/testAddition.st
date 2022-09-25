tests
testAddition
	| m1 m2 new merge |
	m1 := SquotTrackedObjectMetadata newFrom: {#a -> 1}.
	m2 := SquotTrackedObjectMetadata newFrom: {#a -> 1. #b -> (Dictionary newFrom: {#c -> 2})}.
	"This must be detected as a conflict"
	new := (merge := (m1 squotMergeWith: m2 basedOn: m1) resolvedPatch) squotApplyTo: m1.
	self assert: 1 equals: (new at: #a);
		assert: 2 equals: ((new at: #b) at: #c);
		assert: ((new at: #b) ~~ (m2 at: #b));
		assert: ((new at: #b) associationAt: #c) ~~ ((m2 at: #b) associationAt: #c).