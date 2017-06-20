testing
testArrayOfIntegers
	| diff |
	diff := #(1 2) captureWithSquot squotDiffAgainst: #(1 2) captureWithSquot.
	self deny: diff squotHasChanges.
	diff := #(2 1) captureWithSquot squotDiffAgainst: #(1 2) captureWithSquot.
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 1) class == SquotSlotReassignment.
	self assert: (diff slotChanges associationAt: 2) class == SquotSlotReassignment.
	diff := #(1) captureWithSquot squotDiffAgainst: #(1 2) captureWithSquot.
	self assert: diff squotHasChanges.
	self deny: (diff slotChanges includesKey: 1).
	self assert: (diff slotChanges associationAt: 2) class == SquotSlotAddition.
	diff := #(1 2) captureWithSquot squotDiffAgainst: #(1) captureWithSquot.
	self assert: diff squotHasChanges.
	self deny: (diff slotChanges includesKey: 1).
	self assert: (diff slotChanges associationAt: 2) class == SquotSlotRemoval.