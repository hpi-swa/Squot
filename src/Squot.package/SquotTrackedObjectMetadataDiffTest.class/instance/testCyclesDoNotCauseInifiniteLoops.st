tests
testCyclesDoNotCauseInifiniteLoops
	"Even though every object is treated as a value object, cycles should not cause infinite loops."
	| m1 m2 holder diff |
	holder := ValueHolder new.
	holder contents: holder.
	m1 := SquotTrackedObjectMetadata newFrom: {#complex -> holder}.
	m2 := SquotTrackedObjectMetadata newFrom: {#complex -> holder}.
	"when"
	m1 absorbDiff: (diff := m1 squotDiffAgainst: m2).
	"then"
	self assert: (m1 at: #complex) == holder. "Not changed"