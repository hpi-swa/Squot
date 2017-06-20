testing
testBooleans
	| diff |
	diff := true captureWithSquot squotDiffAgainst: true captureWithSquot.
	self deny: diff squotHasChanges.
	diff := false captureWithSquot squotDiffAgainst: false captureWithSquot.
	self deny: diff squotHasChanges.
	diff := true captureWithSquot squotDiffAgainst: false captureWithSquot.
	self assert: diff squotHasChanges.
	self assert: (diff asSquotSlotDiffWithKey: 'x') class == SquotSlotReassignment.
	diff := false captureWithSquot squotDiffAgainst: true captureWithSquot.
	self assert: diff squotHasChanges.
	self assert: (diff asSquotSlotDiffWithKey: 'x') class == SquotSlotReassignment.