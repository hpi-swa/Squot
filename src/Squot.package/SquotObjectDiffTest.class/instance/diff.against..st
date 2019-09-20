helpers
diff: left against: right
	| leftShadow rightShadow |
	leftShadow := capturer captureStandalone: left.
	left become: right.
	[rightShadow := capturer captureStandalone: left]
	ensure: [right become: left].
	^ leftShadow squotDiffAgainst: rightShadow