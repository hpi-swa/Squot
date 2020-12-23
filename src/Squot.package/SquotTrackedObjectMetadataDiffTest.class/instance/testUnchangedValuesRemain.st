tests
testUnchangedValuesRemain
	"Unchanged objects need not be replaced. Soft requirement."
	| str m1 m2 diff |
	str := 'a string' copy.
	m1 := SquotTrackedObjectMetadata newFrom: {#string -> str}.
	m2 := SquotTrackedObjectMetadata newFrom: {#string -> str copy}.
	"when"
	m1 absorbDiff: (diff := m1 squotDiffAgainst: m2).
	"then"
	self assert: (m1 at: #string) == str.