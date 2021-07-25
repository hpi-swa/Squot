helpers
assertDiffAgainstItselfHasNoChanges: anObject
	| left right diff |
	left := capturer captureGraph: anObject.
	right := capturer captureGraph: anObject.
	diff := left squotDiffAgainst: right.
	self deny: diff squotHasChanges.
	^ diff