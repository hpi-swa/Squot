tests
testObjects
	"Graph diff records all changes to objects and knows of transitive/deep changes."
	| a b c shadow1 shadow2 diff diffForC diffForB |
	a := SquotObjectForDiffTests new var1: nil; var2: nil.
	b := SquotObjectForDiffTests new var1: 1; var2: 2.
	c := SquotObjectForDiffTests new var1: a; var2: b.
	shadow1 := capturer captureGraph: c.
	b var1: 3.
	shadow2 := capturer captureGraph: c.
	diff := shadow1 squotDiffAgainst: shadow2.
	self assert: diff squotHasChanges.
	diffForC := diff startDiff.
	self assert: (diffForC slotChanges associationAt: 'var2') class == SquotSlotTransitiveChange.
	self assert: (diff diffForObjectNamed: (objectRegistry nameOf: a) ifAbsent: []) isNil
		description: 'no diff for a'.
	self deny: (diffForC slotChanges includesKey: 'var1')
		description: 'no transitive change for a'.
	diffForB := diff diffForObjectNamed: (objectRegistry nameOf: b) ifAbsent: [].
	self assert: diffForB notNil description: 'diff for b should exist'.
	