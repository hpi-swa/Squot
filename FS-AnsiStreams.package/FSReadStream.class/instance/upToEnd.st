ansi gettable
upToEnd
	| start |
	start := position.
	position := handle size.
	^ handle copyFrom: start to: position