testing
atEnd
	^ toBeVisited allSatisfy: [:each | visited includes: each]