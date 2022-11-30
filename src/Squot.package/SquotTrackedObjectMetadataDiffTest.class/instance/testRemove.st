tests
testRemove
	| m1 m2 diff new |
	m1 := SquotTrackedObjectMetadata newFrom: {#a -> (Dictionary newFrom: {1 -> 1. 2 -> 2}). #b -> 3}.
	m2 := SquotTrackedObjectMetadata newFrom: {#a -> (Dictionary newFrom: {2 -> 2})}.
	"when"
	new := (diff := m1 squotDiffAgainst: m2) squotApplyTo: m1.
	"then"
	self assert: (new at: #a) keys asArray = #(2) description: 'Inner object not removed';
		assert: (new includesKey: #b) not description: 'Object not removed from root'.