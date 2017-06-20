testing
testSmallIntegers
	| diff |
	diff := 1 captureWithSquot squotDiffAgainst: 1 captureWithSquot.
	self deny: diff squotHasChanges.
	diff := 1 captureWithSquot squotDiffAgainst: 2 captureWithSquot.
	self assert: diff squotHasChanges.
	self assert: (diff asSquotSlotDiffWithKey: 'x') class == SquotSlotReassignment.
	self assert: (diff asSquotSlotDiffWithKey: 'x') replacementShadow = 2 captureWithSquot.