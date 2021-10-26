enumerating
next
	latest := breadthFirst ifTrue: [toBeVisited removeFirst] ifFalse: [toBeVisited removeLast].
	history add: latest.
	^ latest