helpers
diff: left against: right
	| leftShadow rightShadow |
	leftShadow := capturer captureGraph: left.
	left become: right.
	[rightShadow := capturer captureGraph: left]
	ensure: [right become: left].
	^ leftShadow squotDiffAgainst: rightShadow