testing
testEmptyObjects
	| diff |
	diff := Object new captureWithSquot squotDiffAgainst: Object new captureWithSquot.
	self deny: diff squotHasChanges.