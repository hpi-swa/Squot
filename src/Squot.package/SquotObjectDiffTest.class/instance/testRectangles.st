testing
testRectangles
	| diff |
	diff := (1@2 corner: 3@4) captureWithSquot squotDiffAgainst: (5@6 corner: 7@8) captureWithSquot.
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 'origin') class == SquotSlotReassignment
		description: 'Points should be reassigned, not modified'.
	self assert: ((diff slotChanges at: 'origin') value slots at: 'x') value = 5.
	self assert: ((diff slotChanges at: 'origin') value slots at: 'y') value = 6.
	self assert: (diff slotChanges associationAt: 'corner') class == SquotSlotReassignment
		description: 'Points should be reassigned, not modified'.
	self assert: ((diff slotChanges at: 'corner') value slots at: 'x') value = 7.
	self assert: ((diff slotChanges at: 'corner') value slots at: 'y') value = 8.