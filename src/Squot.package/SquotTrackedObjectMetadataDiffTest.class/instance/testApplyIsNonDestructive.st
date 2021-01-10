tests
testApplyIsNonDestructive
	| m1 m2 dict diff new |
	m1 := SquotTrackedObjectMetadata newFrom: {#complex -> (Dictionary newFrom: {#a -> {1}})}.
	m2 := SquotTrackedObjectMetadata newFrom: {#complex -> (Dictionary newFrom: {#a -> {2}})}.
	dict := m1 at: #complex.
	"when"
	new := (diff := m1 squotDiffAgainst: m2) squotApplyTo: m1.
	"then"
	self assert: (m1 at: #complex) == dict;
		assert: #(1) equals: (dict at: #a) description: 'Do not mutate originals'.