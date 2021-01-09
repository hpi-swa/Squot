tests
testReplacesStrings
	| m1 m2 str1 diff new |
	m1 := SquotTrackedObjectMetadata newFrom: {#string -> 'abc' copy}.
	m2 := SquotTrackedObjectMetadata newFrom: {#string -> 'def' copy}.
	str1 := m1 at: #string.
	"when"
	new := (diff := (m1 squotMergeWith: m2 basedOn: m1) resolvedPatch) squotApplyTo: m1.
	"then"
	self assert: 'abc' equals: str1;
		assert: (new at: #string) ~~ str1;
		assert: 'def' equals: (new at: #string).