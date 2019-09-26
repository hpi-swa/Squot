testing
testObjects
	| a b c shadow1OfB shadow2OfB shadow1OfC shadow2OfC diff |
	a := SquotObjectForDiffTests new var1: nil; var2: nil.
	b := SquotObjectForDiffTests new var1: 1; var2: 2.
	c := SquotObjectForDiffTests new var1: a; var2: b.
	shadow1OfB := capturer captureStandalone: b.
	shadow1OfC := capturer captureStandalone: c.
	b var1: 3.
	shadow2OfB := capturer captureStandalone: b.
	shadow2OfC := capturer captureStandalone: c.
	diff := shadow1OfB squotDiffAgainst: shadow2OfB.
	self assert: diff slotChanges keys asArray = #('var1').
	self assert: (diff slotChanges associationAt: 'var1') class == SquotSlotReassignment.
	self assert: (diff slotChanges associationAt: 'var1') replacementShadow = 3 captureWithSquot.
	diff := shadow1OfC squotDiffAgainst: shadow2OfC.
	self deny: diff squotHasChanges description: 'slots of c should be unchanged'.
	