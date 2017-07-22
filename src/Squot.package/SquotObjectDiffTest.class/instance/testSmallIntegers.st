testing
testSmallIntegers
	| diff |
	diff := 1 captureWithSquot squotDiffAgainst: 1 captureWithSquot.
	self deny: diff squotHasChanges.
	diff := 1 captureWithSquot squotDiffAgainst: 2 captureWithSquot.
	self assert: diff squotHasChanges.
	self assert: diff startDiff right = 2 captureWithSquot.