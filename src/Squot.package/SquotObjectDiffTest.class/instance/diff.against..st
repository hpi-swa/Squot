helpers
diff: left against: right
	| leftShadow rightShadow |
	leftShadow := capturer capture: left.
	rightShadow := capturer capture: right.
	^ leftShadow squotDiffAgainst: rightShadow