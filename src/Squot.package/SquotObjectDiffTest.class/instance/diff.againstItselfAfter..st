helpers
diff: anObject againstItselfAfter: aBlock
	| leftShadow rightShadow |
	leftShadow := capturer capture: anObject.
	aBlock value.
	rightShadow := capturer capture: anObject.
	^ leftShadow squotDiffAgainst: rightShadow