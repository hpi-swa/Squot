testing
testObjects
	| a b c shadow1OfC shadow2OfC diff diffForC diffForB |
	a := SquotObjectForDiffTests new var1: nil; var2: nil.
	b := SquotObjectForDiffTests new var1: 1; var2: 2.
	c := SquotObjectForDiffTests new var1: a; var2: b.
	shadow1OfC := capturer captureStandalone: c.
	b var1: 3.
	shadow2OfC := capturer captureStandalone: c.
	diff := shadow1OfC squotDiffAgainst: shadow2OfC.
	self assert: diff squotHasChanges.
	diffForC := diff diffForObjectNamed: diff startObjectName ifAbsent: [].
	self assert: diffForC isNil.
	diffForB := diff diffForObjectNamed: (shadow1OfC slots at: 'var2') name.
	self assert: diffForB slotChanges keys asArray = #('var1').
	self assert: (diffForB slotChanges associationAt: 'var1') class == SquotSlotReassignment.
	self assert: (diffForB slotChanges associationAt: 'var1') replacementShadow = 3 captureWithSquot.
	self assert: (diff diffForObjectNamed: (shadow1OfC slots at: 'var1') name ifAbsent: []) isNil.
	