helpers
assertDiffAgainstItselfHasNoChanges: anObject
	| leftShadow rightShadow diff |
	leftShadow := capturer captureStandalone: anObject.
	rightShadow := capturer captureStandalone: anObject.
	diff := leftShadow squotDiffAgainst: rightShadow.
	self deny: diff squotHasChanges.
	^ diff