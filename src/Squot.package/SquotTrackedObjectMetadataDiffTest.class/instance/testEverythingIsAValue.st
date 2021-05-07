tests
testEverythingIsAValue
	"Metadata values are not changed in place, they are always replaced."
	| m1 m2 dict diff |
	m1 := SquotTrackedObjectMetadata newFrom: {#complex -> (Dictionary newFrom: {#a -> {1}})}.
	m2 := SquotTrackedObjectMetadata newFrom: {#complex -> (Dictionary newFrom: {#a -> {2}})}.
	dict := m1 at: #complex.
	"when"
	m1 absorbDiff: (diff := m1 squotDiffAgainst: m2).
	"then"
	self assert: (m1 at: #complex) ~~ dict;
		assert: #(1) equals: (dict at: #a) description: 'Do not mutate originals';
		assert: #(2) equals: ((m1 at: #complex) at: #a);
		assert: ((m1 at: #complex) at: #a) ~~ ((m2 at: #complex) at: #a).