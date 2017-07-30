testing
testPoints
	"Points should be treated as immutable value-objects, even though they strictly are not."
	| point diff pointDiff |
	diff := self diff: (point := 1@2) against: 3@4.
	self assert: diff squotHasChanges.
	pointDiff := diff startDiff.
	self assert: (pointDiff slotChanges associationAt: 'x') class == SquotSlotReassignment.
	self assert: (pointDiff slotChanges associationAt: 'x') replacementShadow value = 3.
	self assert: (pointDiff slotChanges associationAt: 'y') class == SquotSlotReassignment.
	self assert: (pointDiff slotChanges associationAt: 'y') replacementShadow value = 4.