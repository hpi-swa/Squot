accessing
next
	| next |
	[toBeVisited ifEmpty: [^ self error: 'No more objects'].
	next := toBeVisited removeFirst]
		doWhileTrue: [visited includes: next].
	visited add: next.
	guide show: self nextAfter: next.
	^ next