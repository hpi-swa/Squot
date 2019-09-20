helpers
diff: anObject againstItselfAfter: aBlock
	| leftShadow rightShadow |
	leftShadow := capturer captureGraph: anObject.
	aBlock value.
	rightShadow := capturer captureGraph: anObject.
	^ leftShadow squotDiffAgainst: rightShadow