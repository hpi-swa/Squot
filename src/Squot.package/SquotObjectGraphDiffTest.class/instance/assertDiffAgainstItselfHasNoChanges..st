helpers
assertDiffAgainstItselfHasNoChanges: anObject
	| leftShadow rightShadow diff |
	leftShadow := capturer captureGraph: anObject.
	rightShadow := capturer captureGraph: anObject.
	diff := leftShadow squotDiffAgainst: rightShadow.
	self deny: diff squotHasChanges.
	^ diff