tests
testAdditionConflict
	| m1 m2 m3 merge |
	m1 := SquotTrackedObjectMetadata newFrom: {#a -> 1}.
	m2 := SquotTrackedObjectMetadata newFrom: {#a -> 2}.
	m3 := SquotTrackedObjectMetadata new.
	"This must be detected as a conflict"
	merge := m1 squotMergeWith: m2 basedOn: m3.
	self assert: merge hasConflicts.
	"When the incoming version is chosen, and the merge is applied to m1, the result is like m2"
	merge conflicts anyOne chooseIncoming.
	self assert: (m2 at: #a) equals: ((merge resolvedPatch squotApplyTo: m1) at: #a).