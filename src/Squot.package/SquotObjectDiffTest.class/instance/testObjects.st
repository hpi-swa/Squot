testing
testObjects
	| a b c shadow1OfC shadow2OfC diff |
	a := SquotObjectForDiffTests new var1: nil; var2: nil.
	b := SquotObjectForDiffTests new var1: 1; var2: 2.
	c := SquotObjectForDiffTests new var1: a; var2: b.
	shadow1OfC := c captureWithSquot.
	b var1: 3.
	shadow2OfC := c captureWithSquot.
	diff := shadow1OfC squotDiffAgainst: shadow2OfC.
	self assert: diff squotHasChanges.
	self assert: diff slotChanges keys asArray = #('var2').
	self assert: (diff slotChanges associationAt: 'var2') class == SquotSlotDiff
		description: 'Ordinary objects should be patched'.
	self assert: (diff slotChanges at: 'var2') class == SquotObjectDiff.
	self assert: (diff slotChanges at: 'var2') slotChanges keys asArray = #('var1').