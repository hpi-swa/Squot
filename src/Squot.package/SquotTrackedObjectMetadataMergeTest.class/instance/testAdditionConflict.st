tests
testAdditionConflict
	| m1 m2 m3 merge |
	m1 := SquotTrackedObjectMetadata newFrom: {#a -> 1}.
	m2 := SquotTrackedObjectMetadata newFrom: {#a -> 2}.
	m3 := SquotTrackedObjectMetadata new.
	"when"
	merge := m1 squotMergeWith: m2 basedOn: m3.
	"then"
	self assert: merge hasConflicts.