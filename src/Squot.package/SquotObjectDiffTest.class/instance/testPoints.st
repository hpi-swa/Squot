testing
testPoints
	"Points should be treated as immutable value-objects, even though they strictly are not."
	| diff |
	diff := (1@2) captureWithSquot squotDiffAgainst: (3@4) captureWithSquot.
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 'x') class == SquotSlotReassignment.
	self assert: (diff slotChanges at: 'x') value value = 3.
	self assert: (diff slotChanges associationAt: 'y') class == SquotSlotReassignment.
	self assert: (diff slotChanges at: 'y') value value = 4.