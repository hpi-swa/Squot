tests
testIdenticalAddition
	"Usually objects must not be shared among metadata instances, but since Strings are treated as values, this should be allowed."
	| m1 m2 m3 new merge |
	m1 := SquotTrackedObjectMetadata newFrom: {#a -> 1}.
	m2 := SquotTrackedObjectMetadata newFrom: {#a -> 1. #b -> 'string'}.
	m3 := SquotTrackedObjectMetadata newFrom: {#a -> 1. #c -> (m2 at: #b)}.
	new := (merge := (m3 squotMergeWith: m2 basedOn: m1) resolvedPatch) squotApplyTo: m3.
	self assert: 1 equals: (new at: #a);
		assert: 'string' equals: (new at: #b);
		assert: 'string' equals: (new at: #c).
	"Intentionally undefined whether (new at: #b) is identical to (new at: #c) or not."