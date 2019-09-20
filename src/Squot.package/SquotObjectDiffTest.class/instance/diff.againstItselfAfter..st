helpers
diff: anObject againstItselfAfter: aBlock
	| leftShadow rightShadow |
	leftShadow := capturer captureStandalone: anObject.
	aBlock value.
	rightShadow := capturer captureStandalone: anObject.
	^ leftShadow squotDiffAgainst: rightShadow