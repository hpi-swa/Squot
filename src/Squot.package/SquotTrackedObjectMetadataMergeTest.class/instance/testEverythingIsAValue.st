tests
testEverythingIsAValue
	"Metadata values are not changed in place, they are always replaced."
	| m1 m2 dict diff new |
	m1 := SquotTrackedObjectMetadata newFrom: {#complex -> (Dictionary newFrom: {#a -> {1}})}.
	m2 := SquotTrackedObjectMetadata newFrom: {#complex -> (Dictionary newFrom: {#a -> {2}})}.
	dict := m1 at: #complex.
	"when"
	new := (diff := (m1 squotMergeWith: m2 basedOn: m1) resolvedPatch) squotApplyTo: m1.
	"then"
	self assert: (new at: #complex) ~~ dict;
		assert: #(1) equals: (dict at: #a) description: 'Do not mutate originals';
		assert: #(2) equals: ((new at: #complex) at: #a);
		assert: ((new at: #complex) at: #a) ~~ ((m2 at: #complex) at: #a).