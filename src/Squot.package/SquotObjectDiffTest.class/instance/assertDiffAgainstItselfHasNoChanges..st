helpers
assertDiffAgainstItselfHasNoChanges: anObject
	| leftShadow rightShadow diff |
	leftShadow := capturer capture: anObject.
	rightShadow := capturer capture: anObject.
	diff := leftShadow squotDiffAgainst: rightShadow.
	self deny: diff squotHasChanges.
	^ diff