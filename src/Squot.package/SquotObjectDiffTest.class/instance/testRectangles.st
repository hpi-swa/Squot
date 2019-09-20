testing
testRectangles
	| rect rectDiff origin corner |
	origin := 1@2.
	corner := 3@4.
	rect := (origin corner: corner).
	rectDiff := self diff: rect against: (5@6 corner: 7@8).
	self assert: rectDiff squotHasChanges.
	self assert: (rectDiff slotChanges associationAt: 'origin') class == SquotSlotReassignment
		description: 'Points should be reassigned, not modified'.
	self assert: ((rectDiff slotChanges associationAt: 'origin') replacementShadow slots at: 'x') value = 5.
	self assert: ((rectDiff slotChanges associationAt: 'origin') replacementShadow slots at: 'y') value = 6.
	self assert: (rectDiff slotChanges associationAt: 'corner') class == SquotSlotReassignment
		description: 'Points should be reassigned, not modified'.
	self assert: ((rectDiff slotChanges associationAt: 'corner') replacementShadow slots at: 'x') value = 7.
	self assert: ((rectDiff slotChanges associationAt: 'corner') replacementShadow slots at: 'y') value = 8.